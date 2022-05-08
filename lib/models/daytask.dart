class DayTask {
  DateTime date;
  List<Task> tasks;

  DayTask(this.date, this.tasks);
}

enum TaskStatus { incomplete, completed, cancelled, pushed }

class Task {
  String description;
  TaskStatus taskStatus;

  Task(this.description, this.taskStatus);
}
