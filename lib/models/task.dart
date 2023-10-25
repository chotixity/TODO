import 'package:flutter/material.dart';

enum Type {
  other,
  work,
  study,
  personal,
}

class Task implements Comparable {
  final int id;
  final String taskName;
  final String description;
  final DateTime date;
  final Type type;
  final TimeOfDay startTime;
  final TimeOfDay endTime;
  final bool completed;

  Task(
    this.id,
    this.taskName,
    this.description,
    this.date,
    this.type,
    this.startTime,
    this.endTime,
    this.completed,
  );

  Task.fromRow(Map<String, Object?> row)
      : id = row['id'] as int,
        taskName = row['task_name'] as String,
        description = row['description'] as String,
        date = row['date'] as DateTime,
        type = row['type'] as Type,
        startTime = row['start_time'] as TimeOfDay,
        endTime = row['end_time'] as TimeOfDay,
        completed = row['completed'] as bool;

  //@override
  //bool operator ==(covariant Task other) =>
  //   startTime || endTime == other.startTime || other.endTime;

  @override
  // TODO: implement hashCode
  int get hashCode => super.hashCode;

  @override
  String toString() =>
      'Task id=$id, taskName: $taskName, description: $description, date: $date, ';

  @override
  int compareTo(other) {
    return
        // TODO: implement compareTo
        throw UnimplementedError();
  }
}
