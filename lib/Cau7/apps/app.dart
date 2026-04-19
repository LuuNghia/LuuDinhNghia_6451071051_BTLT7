import 'package:flutter/material.dart';
import '../screens/posts/news_feed_screen.dart';

class Cau7 extends StatelessWidget {
  const Cau7({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Câu 7',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: true, colorSchemeSeed: Colors.blue),
      home: const NewsFeedScreen(),
    );
  }
}