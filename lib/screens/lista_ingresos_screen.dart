import 'package:az_intima_flutter/models/ingreso.dart';
import 'package:flutter/material.dart';
import '../db/database_helper.dart';

class ListaIngresosScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Lista de Ingresos")),
      body: FutureBuilder<List<Ingreso>>(
        future: DatabaseHelper.instance.getIngresos(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) return Center(child: CircularProgressIndicator());
          if (snapshot.data!.isEmpty) return Center(child: Text("Sin ingresos registrados"));

          return ListView.builder(
            itemCount: snapshot.data!.length,
            itemBuilder: (context, index) {
              final ingreso = snapshot.data![index];
              return ListTile(
                title: Text(ingreso.descripcion),
                subtitle: Text("Fecha: ${ingreso.fecha}"),
                trailing: Text("\$${ingreso.monto.toStringAsFixed(2)}"),
              );
            },
          );
        },
      ),
    );
  }
}