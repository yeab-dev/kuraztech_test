import 'package:flutter/material.dart';
import 'package:kuraztech_test/presentation/pages/home.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Task Manager',
      theme: ThemeData(primarySwatch: Colors.blue, useMaterial3: true),
      home: const Home(),
    );
  }
}
