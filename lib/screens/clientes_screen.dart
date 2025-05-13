import 'package:flutter/material.dart';
import '../db/database_helper.dart';
import '../models/cliente.dart';

class ClientesScreen extends StatefulWidget {
  @override
  _ClientesScreenState createState() => _ClientesScreenState();
}

class _ClientesScreenState extends State<ClientesScreen> {
  final nombreController = TextEditingController();
  final telefonoController = TextEditingController();
  final correoController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Registrar Cliente")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
                controller: nombreController,
                decoration: InputDecoration(labelText: "Nombre")),
            TextField(
                controller: telefonoController,
                decoration: InputDecoration(labelText: "Teléfono")),
            TextField(
                controller: correoController,
                decoration: InputDecoration(labelText: "Correo")),
            SizedBox(height: 20),
            ElevatedButton(
                onPressed: () async {
                  final cliente = Cliente(
                    nombre: nombreController.text,
                    telefono: telefonoController.text,
                    correo: correoController.text,
                  );
                  await DatabaseHelper.instance.insertCliente(cliente);
                  ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text("Cliente guardado")));
                },
                child: Text("Guardar"))
          ],
        ),
      ),
    );
  }
}
