import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:kuraztech_test/models/task.dart';
import 'package:kuraztech_test/presentation/widgets/task_card.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late List<Task> tasks;

  @override
  void initState() {
    super.initState();
    tasks = [
      Task(
        taskId: "1",
        taskTitle: "Leetcode",
        taskDescription: "solve 2 leetcode problems",
        completed: false,
      ),
      Task(
        taskId: "2",
        taskTitle: "Project",
        taskDescription: "work on side project",
        completed: false,
      ),
      Task(
        taskId: "3",
        taskTitle: "Assignment",
        taskDescription: "complete your assignment",
        completed: false,
      ),
      Task(
        taskId: "4",
        taskTitle: "Coffee time",
        taskDescription: "have a coffee time with friends",
        completed: false,
      ),
      Task(
        taskId: "5",
        taskTitle: "Call mom",
        taskDescription: "call mom and catch up on what's happening",
        completed: false,
      ),
    ];
  }

  void _addTask(String title, String description) {
    setState(() {
      tasks.add(
        Task(
          taskId: '${tasks.length + 1}',
          taskTitle: title,
          taskDescription: description,
          completed: false,
        ),
      );
    });
  }

  void _toggleTaskCompletion(int index) {
    setState(() {
      log(
        'Before toggle - Task ${tasks[index].taskId}: ${tasks[index].completed}',
      );
      tasks[index] = tasks[index].toggleCompleted();
      if (tasks[index].completed) {
        tasks.removeAt(index);
      }
      log(
        'After toggle - Task ${tasks[index].taskId}: ${tasks[index].completed}',
      );
    });
  }

  void _showAddTaskDialog() {
    final titleController = TextEditingController();
    final descriptionController = TextEditingController();

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Add New Task'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: titleController,
              decoration: const InputDecoration(
                labelText: 'Task Title',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16.0),
            TextField(
              controller: descriptionController,
              decoration: const InputDecoration(
                labelText: 'Task Description',
                border: OutlineInputBorder(),
              ),
              maxLines: 3,
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () {
              if (titleController.text.isNotEmpty &&
                  descriptionController.text.isNotEmpty) {
                _addTask(titleController.text, descriptionController.text);
                Navigator.pop(context);
              }
            },
            child: const Text('Add Task'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Task List')),
      body: tasks.isEmpty
          ? const Center(child: Text('No tasks available. Add a new task!'))
          : ListView(
              children: List.generate(tasks.length, (index) {
                return TaskCard(
                  task: tasks[index],
                  onToggleCompleted: () => _toggleTaskCompletion(index),
                );
              }),
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: _showAddTaskDialog,
        child: const Icon(Icons.add),
      ),
    );
  }
}
