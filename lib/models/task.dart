enum Type {
  other,
  work,
  study,
  personal,
}

class Task {
  final String taskName;
  final String description;
  final DateTime dateTime;
  final Type type;

  Task(this.taskName, this.description, this.dateTime, this.type);
}
