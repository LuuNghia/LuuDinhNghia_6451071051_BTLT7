import 'package:flutter/material.dart';
import '../screens/products/product_detail_screen.dart';

class Cau2 extends StatelessWidget {
  const Cau2({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Câu 2',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        useMaterial3: true, 
      ),
      debugShowCheckedModeBanner: false,
      home: const ProductDetailScreen(productId: 1),
    );
  }
}