import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

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

  List<Task> todayTask(String day) {
    return tasks
        .where((task) => DateFormat.yMMMd().format(task.date) == day)
        .toList();
  }

  double completedTasks() {
    final completedTasks = tasks.where((task) => task.completed == true);
    return completedTasks.length / tasks.length;
  }

  addNewTask(Task task) async {
    ///add the task to sqlite
    _dbHelper.insertTask(task);
    print(task.toString());

    ///add
    ///
    ///
    notifyListeners();
  }

  deleteTask(int index) {
    _tasks.removeAt(index);
    notifyListeners();
  }

  fetchTasks() async {
    _tasks = await _dbHelper.fetchTasks();
    notifyListeners();
  }
}
