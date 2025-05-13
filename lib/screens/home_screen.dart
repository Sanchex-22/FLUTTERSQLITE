
import 'package:az_intima_flutter/screens/lista_clientes_screen.dart';
import 'package:az_intima_flutter/screens/lista_egresos_screen.dart';
import 'package:az_intima_flutter/screens/lista_ingresos_screen.dart';
import 'package:az_intima_flutter/screens/lista_productos_screen.dart';
import 'package:flutter/material.dart';
import 'ingresos_screen.dart';
import 'egresos_screen.dart';
import 'clientes_screen.dart';
import 'inventario_screen.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("AZ Íntima")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (_) => IngresosScreen()));
              },
              child: Text("Ingresos"),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (_) => EgresosScreen()));
              },
              child: Text("Egresos"),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (_) => ClientesScreen()));
              },
              child: Text("Clientes"),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (_) => InventarioScreen()));
              },
              child: Text("Inventario"),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (_) => IngresosScreen()));
              },
              child: Text("Registrar Ingreso"),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (_) => ListaIngresosScreen()));
              },
              child: Text("Ver Ingresos"),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (_) => ListaEgresosScreen()));
              },
              child: Text("Ver Egresos"),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (_) => ListaClientesScreen()));
              },
              child: Text("Ver Clientes"),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (_) => ListaProductosScreen()));
              },
              child: Text("Ver Inventario"),
            ),
                        
          ],
        ),
      ),
    );
  }
}