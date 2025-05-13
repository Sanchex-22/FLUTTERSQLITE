import 'package:az_intima_flutter/models/cliente.dart';
import 'package:flutter/material.dart';
import '../db/database_helper.dart';

class ListaClientesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Lista de Clientes")),
      body: FutureBuilder<List<Cliente>>(
        future: DatabaseHelper.instance.getClientes(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) return Center(child: CircularProgressIndicator());
          if (snapshot.data!.isEmpty) return Center(child: Text("Sin clientes registrados"));

          return ListView.builder(
            itemCount: snapshot.data!.length,
            itemBuilder: (context, index) {
              final cliente = snapshot.data![index];
              return ListTile(
                title: Text(cliente.nombre),
                subtitle: Text("Teléfono: ${cliente.telefono}\nEmail: ${cliente.correo}"),
              );
            },
          );
        },
      ),
    );
  }
}
