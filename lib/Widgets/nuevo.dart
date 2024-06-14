import 'package:flutter/material.dart';
import 'package:flutter_with_firebase/services/firebase_services.dart';
import 'package:flutter_with_firebase/services/notifications_services.dart';

class NuevaPersona extends StatefulWidget {
  const NuevaPersona({super.key});

  @override
  State<NuevaPersona> createState() => _NuevaPersonaState();
}

class _NuevaPersonaState extends State<NuevaPersona> {
  TextEditingController nameController = TextEditingController(text: "");
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Crear")),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            TextField(
              controller: nameController,
              decoration: const InputDecoration(hintText: "Escribe un nombre"),
            ),
            ElevatedButton(
              onPressed: () async {
                await guardarPersona(nameController.text).then((value) {
                  mostrarNotificacion('Confirmacion', 'Registro creado correctamente');
                  Navigator.pop(context);
                });
              },
              child: const Text("Guardar"),
            )
          ],
        ),
      ),
    );
  }
}
