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
  // Define the tasks list as a state variable
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

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: List.generate(tasks.length, (index) {
        return TaskCard(
          task: tasks[index],
          onToggleCompleted: () {
            log(
              'Before toggle - Task ${tasks[index].taskId}: ${tasks[index].completed}',
            );
            setState(() {
              tasks[index] = tasks[index].toggleCompleted();
            });
            log(
              'After toggle - Task ${tasks[index].taskId}: ${tasks[index].completed}',
            );
          },
        );
      }),
    );
  }
}
