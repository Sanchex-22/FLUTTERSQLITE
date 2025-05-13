import 'package:flutter/material.dart';
import '../db/database_helper.dart';
import '../models/egreso.dart';

class EgresosScreen extends StatefulWidget {
@override
_EgresosScreenState createState() => _EgresosScreenState();
}

class _EgresosScreenState extends State<EgresosScreen> {
final descripcionController = TextEditingController();
final montoController = TextEditingController();
final fechaController = TextEditingController();

@override
Widget build(BuildContext context) {
return Scaffold(
appBar: AppBar(title: Text("Registrar Egreso")),
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
final egreso = Egreso(
descripcion: descripcionController.text,
monto: double.tryParse(montoController.text) ?? 0.0,
fecha: fechaController.text,
);
await DatabaseHelper.instance.insertEgreso(egreso);
ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Egreso guardado")));
},
child: Text("Guardar")
)
],
),
),
);
}
}