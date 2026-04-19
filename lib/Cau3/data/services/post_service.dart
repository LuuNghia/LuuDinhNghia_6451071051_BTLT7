import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../utils/constants.dart';
import '../models/post_model.dart';

class PostService {
  final String _url = "${AppConstants.baseUrl}/posts";

  Future<http.Response> createPost(Post post) async {
    try {
      final response = await http.post(
        Uri.parse(_url),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode(post.toJson()),
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }
}