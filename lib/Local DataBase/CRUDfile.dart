import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DBHelperCRUD {
  static Database? _db;

  // =========================
  // DATABASE INSTANCE
  // =========================
  static Future<Database> get database async {
    if (_db != null) return _db!;
    _db = await _initDB();
    return _db!;
  }

  // =========================
  // INIT DATABASE
  // =========================
  static Future<Database> _initDB() async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, 'expense_app.db');

    return openDatabase(
      path,
      version: 1,
      onCreate: _createTables,
      onUpgrade: (db, oldVersion, newVersion) async {
        // future upgrades here
      },
    );
  }

  // =========================
  // CREATE TABLES
  // =========================
  static Future<void> _createTables(Database db, int version) async {
    await db.execute('''
      CREATE TABLE IF NOT EXISTS expenses (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        title TEXT NOT NULL,
        amount REAL NOT NULL,
        category TEXT,
        date TEXT,
        note TEXT
      )
    ''');
  }

  // =========================
  // CREATE
  // =========================
  static Future<int> insertExpense(Map<String, dynamic> data) async {
    final db = await database;
    return await db.insert('expenses', data);
  }

  // =========================
  // READ (ALL)
  // =========================
  static Future<List<Map<String, dynamic>>> getAllExpenses() async {
    final db = await database;
    return await db.query('expenses', orderBy: 'date DESC');
  }

  // =========================
  // READ (BY ID)
  // =========================
  static Future<Map<String, dynamic>?> getExpenseById(int id) async {
    final db = await database;
    final result =
        await db.query('expenses', where: 'id = ?', whereArgs: [id]);

    return result.isNotEmpty ? result.first : null;
  }

  // =========================
  // UPDATE
  // =========================
  static Future<int> updateExpense(
      int id, Map<String, dynamic> data) async {
    final db = await database;
    return await db.update(
      'expenses',
      data,
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  // =========================
  // DELETE
  // =========================
  static Future<int> deleteExpense(int id) async {
    final db = await database;
    return await db.delete(
      'expenses',
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  // =========================
  // DELETE ALL
  // =========================
  static Future<void> deleteAllExpenses() async {
    final db = await database;
    await db.delete('expenses');
  }
}
