import 'dart:async';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

import '../models/ingreso.dart';
import '../models/egreso.dart';
import '../models/cliente.dart';
import '../models/producto.dart';

class DatabaseHelper {
  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();
  static Database? _database;

  DatabaseHelper._privateConstructor();

  Future<Database> get database async => _database ??= await _initDatabase();

  Future<Database> _initDatabase() async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, 'azintima.db');

    return await openDatabase(
      path,
      version: 1,
      onCreate: _onCreate,
    );
  }

  Future _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE ingresos (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        descripcion TEXT NOT NULL,
        monto REAL NOT NULL,
        fecha TEXT NOT NULL
      )
    ''');

    await db.execute('''
      CREATE TABLE egresos (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        descripcion TEXT NOT NULL,
        monto REAL NOT NULL,
        fecha TEXT NOT NULL
      )
    ''');

    await db.execute('''
      CREATE TABLE clientes (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        nombre TEXT NOT NULL,
        telefono TEXT NOT NULL,
        correo TEXT NOT NULL
      )
    ''');

    await db.execute('''
      CREATE TABLE productos (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        nombre TEXT NOT NULL,
        cantidad INTEGER NOT NULL,
        precio REAL NOT NULL
      )
    ''');
  }

  // Métodos CRUD para Ingreso
  Future<int> insertIngreso(Ingreso ingreso) async {
    final db = await database;
    return await db.insert('ingresos', ingreso.toMap());
  }

  Future<List<Ingreso>> getIngresos() async {
    final db = await database;
    final maps = await db.query('ingresos');
    return List.generate(maps.length, (i) => Ingreso.fromMap(maps[i]));
  }

  // Métodos CRUD para Egreso
  Future<int> insertEgreso(Egreso egreso) async {
    final db = await database;
    return await db.insert('egresos', egreso.toMap());
  }

  Future<List<Egreso>> getEgresos() async {
    final db = await database;
    final maps = await db.query('egresos');
    return List.generate(maps.length, (i) => Egreso.fromMap(maps[i]));
  }

  // Métodos CRUD para Cliente
  Future<int> insertCliente(Cliente cliente) async {
    final db = await database;
    return await db.insert('clientes', cliente.toMap());
  }

  Future<List<Cliente>> getClientes() async {
    final db = await database;
    final maps = await db.query('clientes');
    return List.generate(maps.length, (i) => Cliente.fromMap(maps[i]));
  }

  // Métodos CRUD para Producto
  Future<int> insertProducto(Producto producto) async {
    final db = await database;
    return await db.insert('productos', producto.toMap());
  }

  Future<List<Producto>> getProductos() async {
    final db = await database;
    final maps = await db.query('productos');
    return List.generate(maps.length, (i) => Producto.fromMap(maps[i]));
  }
}
