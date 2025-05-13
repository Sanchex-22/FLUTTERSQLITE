import 'package:flutter/material.dart';
import '../db/database_helper.dart';
import '../models/producto.dart';

class InventarioScreen extends StatefulWidget {
  @override
  _InventarioScreenState createState() => _InventarioScreenState();
}

class _InventarioScreenState extends State<InventarioScreen> {
  final nombreController = TextEditingController();
  final cantidadController = TextEditingController();
  final precioController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Registrar Producto")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
                controller: nombreController,
                decoration: InputDecoration(labelText: "Nombre")),
            TextField(
                controller: cantidadController,
                decoration: InputDecoration(labelText: "Cantidad"),
                keyboardType: TextInputType.number),
            TextField(
                controller: precioController,
                decoration: InputDecoration(labelText: "Precio"),
                keyboardType: TextInputType.number),
            SizedBox(height: 20),
            ElevatedButton(
                onPressed: () async {
                  final producto = Producto(
                    nombre: nombreController.text,
                    cantidad: int.tryParse(cantidadController.text) ?? 0,
                    precio: double.tryParse(precioController.text) ?? 0.0,
                  );
                  await DatabaseHelper.instance.insertProducto(producto);
                  ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text("Producto guardado")));
                },
                child: Text("Guardar"))
          ],
        ),
      ),
    );
  }
}
