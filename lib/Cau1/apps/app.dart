import 'package:flutter/material.dart';
import '../screens/users/user_screen.dart';

class Cau1 extends StatelessWidget {
  const Cau1({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Câu 1',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        useMaterial3: true, 
      ),
      debugShowCheckedModeBanner: false,
      home: const UserScreen(),
    );
  }
}