import 'package:az_intima_flutter/models/egreso.dart';
import 'package:flutter/material.dart';
import '../db/database_helper.dart';

class ListaEgresosScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Lista de Egresos")),
      body: FutureBuilder<List<Egreso>>(
        future: DatabaseHelper.instance.getEgresos(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) return Center(child: CircularProgressIndicator());
          if (snapshot.data!.isEmpty) return Center(child: Text("Sin egresos registrados"));

          return ListView.builder(
            itemCount: snapshot.data!.length,
            itemBuilder: (context, index) {
              final egreso = snapshot.data![index];
              return ListTile(
                title: Text(egreso.descripcion),
                subtitle: Text("Fecha: ${egreso.fecha}"),
                trailing: Text("\$${egreso.monto.toStringAsFixed(2)}"),
              );
            },
          );
        },
      ),
    );
  }
}