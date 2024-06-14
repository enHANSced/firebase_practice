import 'package:flutter/material.dart';
import 'package:flutter_with_firebase/Widgets/actualizar.dart';
import 'package:flutter_with_firebase/services/firebase_services.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Personas"),
        centerTitle: true,
        elevation: 4.0, // Añade sombra al AppBar
      ),
      body: FutureBuilder(
          future: listar(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            }

            if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            }

            if (!snapshot.hasData || snapshot.data!.isEmpty) {
              return const Center(child: Text("No data found"));
            }

            return ListView.builder(
                itemCount: snapshot.data?.length,
                itemBuilder: (context, index) {
                  var persona = snapshot.data?[index];
                  return Card( // Envuelve cada ListTile en un Card para una mejor visualización
                    margin: const EdgeInsets.only(top: 15.0, left: 10.0, right: 10.0),
                    child: ListTile(
                      title: Text(persona?['name'], style: const TextStyle(fontSize: 18.0)), // Aumenta el tamaño de la fuente
                      leading: const Icon(Icons.people_alt, size: 30.0), // Aumenta el tamaño del icono
                      trailing: PopupMenuButton(
                          icon: const Icon(Icons.more_vert),
                          onSelected: (value) async {
                            if (value == 'edit') {
                              await Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => ActualizarPersona(
                                    id: persona?['id'],
                                  ),
                                ),
                              );
                              setState(() {});
                            } else if (value == 'delete') {
                              bool? confirmDelete = await showDialog(
                                context: context,
                                builder: (context) {
                                  return AlertDialog(
                                    title: const Text("Confirmar eliminacion"),
                                    content: const Text(
                                        "Estas seguro que deseas eliminarlo?"),
                                    actions: [
                                      TextButton(
                                        onPressed: () {
                                          Navigator.of(context).pop(false);
                                        },
                                        child: const Text("Cancelar"),
                                      ),
                                      TextButton(
                                        onPressed: () {
                                          Navigator.of(context).pop(true);
                                        },
                                        child: const Text("Eliminar"),
                                      ),
                                    ],
                                  );
                                },
                              );
                              if (confirmDelete == true) {
                                await eliminarPersona(persona?['id']);
                                setState(() {});
                              }
                            }
                          },
                          itemBuilder: (context) {
                            return [
                              const PopupMenuItem(
                                value: 'edit',
                                child: Text("Editar"),
                              ),
                              const PopupMenuItem(
                                value: 'delete',
                                child: Text("Eliminar"),
                              ),
                            ];
                          }),
                    ),
                  );
                });
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await Navigator.pushNamed(context, "/add");
          setState(() {});
        },
        child: const Icon(Icons.add, size: 30.0), // Aumenta el tamaño del icono
      ),
    );
  }
}

