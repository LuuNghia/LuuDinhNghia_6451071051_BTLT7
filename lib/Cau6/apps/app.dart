import 'package:flutter/material.dart';
import '../screens/products/product_search_screen.dart';

class Cau6 extends StatelessWidget {
  const Cau6({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Câu 6',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.teal),
        useMaterial3: true,
      ),
      home: const ProductSearchScreen(),
    );
  }
}