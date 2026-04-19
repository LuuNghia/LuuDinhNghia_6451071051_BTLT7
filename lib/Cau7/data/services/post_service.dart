import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../utils/constants.dart';
import '../models/post_model.dart';

class PostService {
  final String _url = "${AppConstants.baseUrl}/posts";

  Future<List<Post>> fetchPosts() async {
    final response = await http.get(Uri.parse(_url));
    if (response.statusCode == 200) {
      List data = jsonDecode(response.body);
      return data.map((item) => Post.fromJson(item)).toList();
    }
    throw Exception("Không thể tải dữ liệu");
  }
}