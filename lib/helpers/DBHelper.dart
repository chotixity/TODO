import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

class DBHelper {
  Database? _db;

  ///check if the database exists
  Future<Database> getDatabase() {
    //if
  }

  ///create database
  Future<Database> database() async {
    final database =
        openDatabase(join(await getDatabasesPath(), 'tasks_database.db'));
    return database;
  }
}
