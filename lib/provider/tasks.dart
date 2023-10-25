import 'package:flutter/material.dart';

import '../helpers/DBHelper.dart';
import '../models/task.dart';

class Tasks extends ChangeNotifier {
  final DBHelper _dbHelper = DBHelper();
  /*A  task should have the following:
  Name, Description, Date, Type ?, start time and end time, Mark as completed
  
   */
  List<Task> _tasks = [];

  List<Task> get tasks {
    return [..._tasks];
  }

  addNewTask(Task task) async {
    ///add the task to sqlite
    _dbHelper.insertTask(task);

    ///add
    ///
    ///
    notifyListeners();
  }

  fetchTasks() async {
    _tasks = await _dbHelper.fetchTasks();
    notifyListeners();
  }
}
