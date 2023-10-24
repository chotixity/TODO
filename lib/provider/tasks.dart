import 'package:flutter/material.dart';

import '../models/task.dart';

class Tasks extends ChangeNotifier {
   
  /*A  task should have the following:
  Name, Description, Date, Type ?, start time and end time, Mark as completed
  
   */
  final List<Task> _tasks = [];

  List<Task> get tasks {
    return [..._tasks];
  }

   addNewTask() async {
    ///add the task to sqlite
    ///add
    ///
    ///
    notifyListeners();
  }
}
