import 'package:flutter/material.dart';
import 'package:kuraztech_test/models/task.dart';

class TaskCard extends StatelessWidget {
  final Task task;
  const TaskCard({super.key, required this.task});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      elevation: 4.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              task.taskTitle,
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 8.0),
            Text(
              'ID: ${task.taskId}',
              style: Theme.of(
                context,
              ).textTheme.bodySmall?.copyWith(color: Colors.grey[600]),
            ),
            const SizedBox(height: 8.0),
            Text(
              task.taskDescription,
              style: Theme.of(
                context,
              ).textTheme.bodyMedium?.copyWith(color: Colors.black54),
            ),
          ],
        ),
      ),
    );
  }
}
