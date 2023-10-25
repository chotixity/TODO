import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import '../models/task.dart';

class DBHelper {
  Database? _db;

  ///check if the database exists
  Future<Database> get database async {
    if (_db != null) {
      return _db!;
    }
    _db = await _initialize();
    return _db!;
    //if
  }

  ///create database
  Future<Database> _initialize() async {
    final database = openDatabase(
      join(await getDatabasesPath(), 'tasks_database.db'),
      onCreate: (db, version) {},
      version: 1,
    );
    return database;
  }

  ///create Table
  Future<void> createTasksTable(Database database) async {
    await database.execute(
      '''CREATE TABLE IF NOT EXISTS TASKS (
      'id' INTEGER NOT NULL,
      'task_name' TEXT NOT NULL,
      'description' TEXT,
      'type' TEXT,

      PRIMARY KEY('id' AUTOINCREMENT)
    )
    ''',
    );
  }
}
