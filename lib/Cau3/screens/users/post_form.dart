import 'package:flutter/material.dart';
import '../../data/models/post_model.dart';
import '../../data/services/post_service.dart';

class PostFormScreen extends StatefulWidget {
  const PostFormScreen({super.key});

  @override
  State<PostFormScreen> createState() => _PostFormScreenState();
}

class _PostFormScreenState extends State<PostFormScreen> {
  final _titleController = TextEditingController();
  final _bodyController = TextEditingController();
  final _postService = PostService();

  void _submitData() async {
    final title = _titleController.text;
    final body = _bodyController.text;

    if (title.isEmpty || body.isEmpty) return;

    final newPost = Post(title: title, body: body);
    
    try {
      final response = await _postService.createPost(newPost);

      if (response.statusCode == 201) {
        print("Response từ server: ${response.body}");
        
        if (!mounted) return;
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Post created successfully")),
        );
      }
    } catch (e) {
      print("Lỗi kết nối: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Tạo bài viết")),
      body: Column(
        children: [
          // Thông tin sinh viên phía trên
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(16),
            alignment: Alignment.center,
            child: const Text(
              "Lưu Đình Nghĩa - 6451071051",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                TextField(
                  controller: _titleController,
                  decoration: const InputDecoration(labelText: 'Tiêu đề'),
                ),
                TextField(
                  controller: _bodyController,
                  decoration: const InputDecoration(labelText: 'Nội dung'),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: _submitData,
                  child: const Text("Gửi bài viết"),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}