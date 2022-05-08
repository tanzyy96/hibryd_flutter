class DayTask {
  final DateTime date;
  final List<Task> tasks;

  DayTask(this.date, this.tasks);
}

enum TaskStatus { incomplete, completed, cancelled, pushed }

class Task {
  final String description;
  final TaskStatus taskStatus;

  Task(this.description, this.taskStatus);
}
