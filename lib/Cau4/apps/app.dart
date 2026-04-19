import 'package:flutter/material.dart';
import '../screens/users/user_edit_form.dart';

class Cau4 extends StatelessWidget {
  const Cau4({super.key});

  @override
  Widget build(BuildContext context) {
    
    return MaterialApp(
      title: 'Câu 4',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: true, colorSchemeSeed: Colors.orange),
      home: const UserEditForm(),
    );
  }
}