class Task {
  final String taskId;
  final String taskTitle;
  final String taskDescription;
  final bool completed;

  const Task({
    required this.taskId,
    required this.taskTitle,
    required this.taskDescription,
    required this.completed,
  });

  Task toggleCompleted() {
    return (Task(
      taskId: taskId,
      taskTitle: taskTitle,
      taskDescription: taskDescription,
      completed: !completed,
    ));
  }
}
