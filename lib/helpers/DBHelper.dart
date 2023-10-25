import 'dart:async';

import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import '../models/task.dart';

class DBHelper {
  Database? _db;
  List<Task> _tasks = [];
  final _streamController = StreamController<List<Task>>.broadcast();

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
      onCreate: (db, version) async {
        createTasksTable(db);

        ///read available tasks
        _tasks = await fetchTasks();
        _streamController.add(_tasks);
      },
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
      'type' TEXT NOT NULL,
      'date' TEXT,   
      'start_time, TEXT NOT NULL,
      'end_time' TEXT NOT NULL,
      'completed' TEXT NOT NULL,
      PRIMARY KEY('id' AUTOINCREMENT)
    )
    ''',
    );
  }

  Future<List<Task>> fetchTasks() async {
    final db = _db;
    if (db == null) {
      return [];
    }
    try {
      final read = await db.query(
        'TASKS',
        distinct: true,
      );
      final tasks = read.map((row) => Task.fromRow(row)).toList();
      return tasks;
    } catch (e) {
      print(e);
      return [];
    }
  }
}
