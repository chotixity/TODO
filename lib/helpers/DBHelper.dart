import 'dart:async';

import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import '../models/task.dart';

class DBHelper {
  Database? _db;
  final List<Task> _tasks = [];
  final _streamController = StreamController<List<Task>>.broadcast();
  Stream<List<Task>> all() => _streamController.stream;

  ///check if the database exists
  Future<Database> opendatabase() async {
    if (_db != null) {
      return _db!;
    }
    _db = await _initialize();
    return _db!;
  }

  Future<bool> close() async {
    final db = _db;
    if (db == null) {
      return false;
    }
    await db.close();
    return true;
  }

  ///create database
  Future<Database> _initialize() async {
    final database = openDatabase(
      join(await getDatabasesPath(), 'tasks_database.db'),
      onCreate: (db, version) async {
        createTasksTable(db);

        ///read available tasks
        //_tasks = await fetchTasks();
        //_streamController.add(_tasks);
      },
      version: 1,
    );

    return database;
  }

  ///create Table
  Future<void> createTasksTable(Database database) async {
    const sql = '''CREATE TABLE IF NOT EXISTS TASKS (
  id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
  task_name TEXT NOT NULL,
  description TEXT,
  type TEXT NOT NULL,
  date TEXT,
  start_time TEXT NOT NULL,
  end_time TEXT NOT NULL,
  completed TEXT NOT NULL
);''';

    await database.execute(sql);
  }

  Future<List<Task>> fetchTasks() async {
    final db = _db;
    if (db == null) {
      return [];
    }
    try {
      final read = await db.query('TASKS',
          distinct: true,
          groupBy: 'date',
          //where: 'date = ?',
          orderBy: 'start_time',
          columns: [
            'task_name',
            'description',
            'start_time',
            'end_time',
          ]);
      final tasks = read.map((row) => Task.fromRow(row)).toList();
      return tasks;
    } catch (e) {
      print(e);
      return [];
    }
  }

  Future<void> insertTask(Task task) async {
    final db = _db;
    try {
      db!.insert('TASKS', {
        'task_name': task.taskName,
        'description': task.description,
        'type': task.type,
        'date': task.date,
        'start_time': task.startTime,
        'end_time': task.endTime,
        'completed': task.completed
      });
    } catch (e) {
      print('$e');
    }
  }

  // Future<void> deleteTask(){

  // }
}
