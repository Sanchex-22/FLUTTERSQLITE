import 'package:az_intima_flutter/models/ingreso.dart';
import 'package:flutter/material.dart';
import '../db/database_helper.dart';

class IngresosScreen extends StatefulWidget {
  @override
  _IngresosScreenState createState() => _IngresosScreenState();
}

class _IngresosScreenState extends State<IngresosScreen> {
  final descripcionController = TextEditingController();
  final montoController = TextEditingController();
  final fechaController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Registrar Ingreso")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(controller: descripcionController, decoration: InputDecoration(labelText: "Descripción")),
            TextField(controller: montoController, decoration: InputDecoration(labelText: "Monto"), keyboardType: TextInputType.number),
            TextField(controller: fechaController, decoration: InputDecoration(labelText: "Fecha")),
            SizedBox(height: 20),
            ElevatedButton(
                onPressed: () async {
                  final ingreso = Ingreso(
                    descripcion: descripcionController.text,
                    monto: double.tryParse(montoController.text) ?? 0.0,
                    fecha: fechaController.text,
                  );

                  await DatabaseHelper.instance.insertIngreso(ingreso);

                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Ingreso guardado")));

// Limpiar campos
                  descripcionController.clear();
                  montoController.clear();
                  fechaController.clear();
                },
              child: Text("Guardar")
            )
          ],
        ),
      ),
    );
  }
}
