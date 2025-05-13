import 'package:flutter/material.dart';
import '../db/database_helper.dart';
import '../models/producto.dart';

class ListaProductosScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Inventario")),
        body: FutureBuilder<List<Producto>>(
          future: DatabaseHelper.instance.getProductos(),
          builder: (context, snapshot) {
            if (!snapshot.hasData)
              return Center(child: CircularProgressIndicator());
            if (snapshot.data!.isEmpty)
              return Center(child: Text("Sin productos registrados"));

            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                final producto = snapshot.data![index];
                return ListTile(
                  title: Text(producto.nombre),
                  subtitle: Text(
                      "Precio: \$${producto.precio}\nStock: ${producto.cantidad}"),
                );
              },
            );
          },
        ));
  }
}
