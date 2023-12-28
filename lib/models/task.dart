import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
part 'task.g.dart';

enum Type {
  other,
  work,
  study,
  personal,
}

@HiveType(typeId: 0)
class Task extends HiveObject implements Comparable {
  //final int id;
  @HiveField(0)
  final String taskName;
  @HiveField(1)
  final String description;
  @HiveField(2)
  final DateTime date;
  @HiveField(3)
  final String type;
  @HiveField(4)
  final TimeOfDay startTime;
  @HiveField(5)
  final TimeOfDay endTime;
  @HiveField(6)
  final bool completed;

  Task(
    //this.id,
    this.taskName,
    this.description,
    this.date,
    this.type,
    this.startTime,
    this.endTime,
    this.completed,
  );

  Task.fromRow(Map<String, Object?> row)
      : //id = row['id'] as int,
        taskName = row['task_name'] as String,
        description = row['description'] as String,
        date = row['date'] as DateTime,
        type = row['type'] as String,
        startTime = row['start_time'] as TimeOfDay,
        endTime = row['end_time'] as TimeOfDay,
        completed = row['completed'] as bool;

  //@override
  //bool operator ==(covariant Task other) =>
  //   startTime || endTime == other.startTime || other.endTime;

  @override
  String toString() =>
      'Task taskName: $taskName, description: $description, date: $date, ';

  @override
  int compareTo(other) {
    return
        // TODO: implement compareTo
        throw UnimplementedError();
  }
}
