import 'package:cloud_firestore/cloud_firestore.dart';

FirebaseFirestore db = FirebaseFirestore.instance;

Future<List<Map<String, dynamic>>> listar() async {
  List<Map<String, dynamic>> personas = [];
  CollectionReference collectionReferencePersonas = db.collection('personas');
  QuerySnapshot queryPersonas = await collectionReferencePersonas.get();
  for (var documento in queryPersonas.docs) {
    Map<String, dynamic> data = documento.data() as Map<String, dynamic>;
    data['id'] = documento.id;
    personas.add(data);
  }
  return personas;
}

Future<void> guardarPersona(String nombre) async {
  await db.collection("personas").add({"name": nombre});
}

Future<void> actualizarPersona(String id, String nombre) async {
  await db.collection("personas").doc(id).update({"name": nombre});
}

Future<void> eliminarPersona(String id) async {
  await db.collection("personas").doc(id).delete();
}

Future<Map<String, dynamic>> obtenerPersonaPorId(String id) async {
  DocumentSnapshot docSnapshot = await db.collection("personas").doc(id).get();
  if (docSnapshot.exists) {
    return docSnapshot.data() as Map<String, dynamic>;
  } else {
    throw Exception("Documento no encontrado");
  }
}