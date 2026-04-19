import 'package:flutter/material.dart';
import '../screens/users/post_form.dart';

class Cau3 extends StatelessWidget {
  const Cau3({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Câu 3',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      home: const PostFormScreen(),
    );
  }
}