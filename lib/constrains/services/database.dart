import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper._internal();

  factory DatabaseHelper() => _instance;

  DatabaseHelper._internal();

  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await initDatabase();
    return _database!;
  }

  Future<Database> initDatabase() async {
    return openDatabase(
      join(await getDatabasesPath(), 'my_database.db'),
      onCreate: (db, version) {
        return db.execute(
          'CREATE TABLE my_route(id INTEGER PRIMARY KEY, name TEXT NOT NULL)',
        );
      },
      version: 1,
    );
  }

  // Future<void> insertData(String tableName, Map<String, dynamic> data) async {
  //   final db = await database;
  //   await db.insert(
  //     tableName,
  //     data,
  //     conflictAlgorithm: ConflictAlgorithm.replace,
  //   );
  // }

  Future<void> insertData(
    String id,
    String name,
  ) async {
    final db = await database;

    await db.insert('my_route', {
      'id': id,
      'name': name,
    });

    // Add more methods for other database operations (e.g., query, update, delete) as needed.
  }
}
// import 'package:flutter/material.dart';
// import 'package:sqflite/sqflite.dart';
// import 'package:path/path.dart';

// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   final database = await openDatabase(
//     join(await getDatabasesPath(), 'my_database.db'),
//     onCreate: (db, version) {
//       return db.execute(
//         'CREATE TABLE my_table(id INTEGER PRIMARY KEY, name TEXT)',
//       );
//     },
//     version: 1,
//   );
// }
