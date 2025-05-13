import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'screens/home_screen.dart';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';

void exportDatabase() async {
  final dbPath = await getDatabasesPath();
  final sourcePath = join(dbPath, 'azintima.db');

  final directory = await getExternalStorageDirectory();
  final targetPath = join(directory!.path, 'azintima_export.db');

  final file = File(sourcePath);
  final newFile = await file.copy(targetPath);

  print('Copia exportada en: ${newFile.path}');
}

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'AZ Íntima',
      theme: ThemeData(primarySwatch: Colors.pink),
      home: HomeScreen(),
    );
  }
}