import 'package:flutter/material.dart';
import 'package:flutter_with_firebase/services/firebase_services.dart';

class ActualizarPersona extends StatefulWidget {
  final String id;
  const ActualizarPersona({super.key, required this.id});

  @override
  State<ActualizarPersona> createState() => _ActualizarPersonaState();
}

class _ActualizarPersonaState extends State<ActualizarPersona> {
  TextEditingController nameController = TextEditingController(text: "");
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    cargarDatos();
  }

  Future<void> cargarDatos() async {
    try {
      Map<String, dynamic> persona = await obtenerPersonaPorId(widget.id);
      nameController.text = persona['name'];
    } catch (e) {
      print('Error al obtener datos: $e');
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Actualizar")),
      body: isLoading
        ? const Center(child: CircularProgressIndicator())
        : Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              TextField(
                controller: nameController,
                decoration: const InputDecoration(hintText: "Escribe un nombre"),
              ),
              ElevatedButton(
                onPressed: () async {
                   await actualizarPersona(widget.id, nameController.text). then((value) => {
                    Navigator.pop(context)
                   });
                },
                child: const Text("Actualizar"),
              ),
            ],
          ),
        ),
    );
  }
}