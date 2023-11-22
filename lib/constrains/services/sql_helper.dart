import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart' as sql;
import 'package:sqflite/sqflite.dart';

class SQLHelper {
  static Future<void> createTable(sql.Database database) async {
    await database.execute(
        """CREATE TABLE expenses(id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
    busId TEXT,
    expenseType TEXT,
    expenseValue TEXT) """);
  }

  static Future<sql.Database> db() async {
    return sql.openDatabase('expense_endshift.db', version: 1,
        onCreate: ((db, version) async {
      await createTable(db);
    }));
  }

  static Future<int> createItem(String busId, String type, String value) async {
    final db = await SQLHelper.db();
    final data = {'busId': busId, 'expenseType': type, 'expenseValue': value};
    final id = await db.insert('expenses', data,
        conflictAlgorithm: sql.ConflictAlgorithm.replace);
    return id;
  }

  static Future<List<Map<String, dynamic>>> getItems() async {
    final db = await SQLHelper.db();
    return db.query('expenses', orderBy: 'id');
  }

  static Future<void> deleteItem(int id) async {
    final db = await SQLHelper.db();
    try {
      await db.delete("expenses", where: "id = ?", whereArgs: [id]);
    } catch (er) {
      debugPrint("Something Went Wrong when deleting an item: $er");
    }
  }

  static Future<void> deleteDatabaseFile() async {
    // Get the path to the database file
    String databasesPath = await getDatabasesPath();
    String dbPath = join(databasesPath, 'expense_endshift.db');

    // Delete the database file
    await deleteDatabase(dbPath);

    print('Database deleted successfully');
  }
}
