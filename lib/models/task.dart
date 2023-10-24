import 'package:flutter/material.dart';

enum Type {
  other,
  work,
  study,
  personal,
}

class Task {
  final int id;
  final String taskName;
  final String description;
  final DateTime dateTime;
  final Type type;
  final TimeOfDay startTime;
  final TimeOfDay endTime;
  final bool completed;

  Task(
    this.id,
    this.taskName,
    this.description,
    this.dateTime,
    this.type,
    this.startTime,
    this.endTime,
    this.completed,
  );
}
