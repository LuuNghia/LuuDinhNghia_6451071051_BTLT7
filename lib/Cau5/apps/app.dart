import 'package:flutter/material.dart';
import '../screens/tasks/task_list_screen.dart';

class Cau5 extends StatelessWidget {
  const Cau5({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Câu 5',
      debugShowCheckedModeBanner: false,
      home: const TaskListScreen(),
    );
  }
}