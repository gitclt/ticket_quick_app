import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:ticket_quick_app/app/models/end_shift_model.dart';

class SQLHelper {
  static Database? _database;
  static const String dbName = 'expense_endshift.db';

  static Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await initDatabase();
    return _database!;
  }

  static Future<Database> initDatabase() async {
    String path = join(await getDatabasesPath(), dbName);

    return await openDatabase(path, version: 1, onCreate: (db, version) async {
      await db.execute(
          """CREATE TABLE expenses(id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
    busId TEXT,
    expenseType TEXT,
    expenseValue TEXT) """);
    });
  }

  // static Future<void> createTable(sql.Database database) async {
  //   await database.execute(
  //       """CREATE TABLE expenses(id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
  //   busId TEXT,
  //   expenseType TEXT,
  //   expenseValue TEXT) """);
  // }

  // static Future<sql.Database> db() async {
  //   return sql.openDatabase('expense_endshift.db', version: 1,
  //       onCreate: ((db, version) async {
  //     await createTable(db);
  //   }));
  // }

  static Future<void> createItem(
      String busId, String type, String value) async {
    final db = await database;
    final data = {'busId': busId, 'expenseType': type, 'expenseValue': value};
    await db.insert('expenses', data,
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  static Future<void> deleteDatabaseFile() async {
    final path = join(await getDatabasesPath(), dbName);
    await deleteDatabase(path);
    _database = null;
  }

  static Future<List<Map<String, dynamic>>> getItems() async {
    final db = await database;
    return db.query('expenses', orderBy: 'id');
  }

  static Future<void> deleteItem(List<EndShiftModel> expense) async {
    final db = await database;

    await db.delete("expenses");

    for (var value in expense) {
      final data = {
        'busId': value.id,
        'expenseType': value.text,
        'expenseValue': value.value
      };
      await db.insert('expenses', data,
          conflictAlgorithm: ConflictAlgorithm.replace);
    }
  }

  // static Future<void> deleteDatabaseFile() async {
  //   // Get the path to the database file
  //   String databasesPath = await getDatabasesPath();
  //   String dbPath = join(databasesPath, 'expense_endshift.db');

  //   // Delete the database file
  //   await deleteDatabase(dbPath);

  //   print('Database deleted successfully');
  // }
}
