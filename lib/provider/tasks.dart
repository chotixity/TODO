import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../helpers/DBHelper.dart';
import '../models/task.dart';

class Tasks extends ChangeNotifier {
  final DBHelper _dbHelper = DBHelper();
  /*A  task should have the following:
  Name, Description, Date, Type ?, start time and end time, Mark as completed
  
   */

  List<Task> _tasks = [
    Task(
      1,
      'Go to School',
      'Do Araka\'s Assignment',
      DateTime.now(),
      Type.personal,
      TimeOfDay.now(),
      TimeOfDay.now(),
      false,
    ),
    Task(
      1,
      'Sleep',
      'Do Araka\'s Assignment',
      DateTime.now(),
      Type.personal,
      TimeOfDay.now(),
      TimeOfDay.now(),
      false,
    ),
    Task(
      1,
      'Go to School',
      'Do Araka\'s Assignment',
      DateTime.now().add(const Duration(days: 1)),
      Type.personal,
      TimeOfDay.now(),
      TimeOfDay.now(),
      false,
    ),
    Task(
      1,
      'Hello',
      'Do Araka\'s Assignment',
      DateTime.now(),
      Type.personal,
      TimeOfDay.now(),
      TimeOfDay.now(),
      false,
    ),
  ];

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
    notifyListeners();
    return completedTasks.length / tasks.length;
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
