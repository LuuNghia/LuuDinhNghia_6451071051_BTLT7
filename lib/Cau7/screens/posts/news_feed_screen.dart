import 'package:flutter/material.dart';
import '../../data/models/post_model.dart';
import '../../data/services/post_service.dart';

class NewsFeedScreen extends StatefulWidget {
  const NewsFeedScreen({super.key});

  @override
  State<NewsFeedScreen> createState() => _NewsFeedScreenState();
}

class _NewsFeedScreenState extends State<NewsFeedScreen> {
  final PostService _postService = PostService();
  List<Post> _posts = [];
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _handleRefresh();
  }

  Future<void> _handleRefresh() async {
    try {
      final data = await _postService.fetchPosts();
      setState(() {
        _posts = data;
        _isLoading = false;
      });
    } catch (e) {
      setState(() => _isLoading = false);
      print("Lỗi: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Tin tức mới nhất")),
      body: Column(
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(16),
            alignment: Alignment.center,
            child: const Text(
              "Lưu Đình Nghĩa - 6451071051",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
          ),
          
          Expanded(
            child: _isLoading
                ? const Center(child: CircularProgressIndicator())
                : RefreshIndicator(
                    onRefresh: _handleRefresh, 
                    child: ListView.builder(
                      itemCount: _posts.length,
                      physics: const AlwaysScrollableScrollPhysics(), 
                      itemBuilder: (context, index) {
                        final post = _posts[index];
                        return Card(
                          margin: const EdgeInsets.all(8),
                          child: ListTile(
                            leading: CircleAvatar(child: Text("${index + 1}")),
                            title: Text(post.title, style: const TextStyle(fontWeight: FontWeight.bold)),
                            subtitle: Text(post.body, maxLines: 2),
                          ),
                        );
                      },
                    ),
                  ),
          ),
        ],
      ),
    );
  }
}