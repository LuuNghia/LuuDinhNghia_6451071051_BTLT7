import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../utils/constants.dart';
import '../models/user_model.dart';

class UserService {
  Future<UserModel> getUser(String id) async {
    final response = await http.get(Uri.parse("${AppConstants.baseUrl}/users/$id"));
    if (response.statusCode == 200) {
      return UserModel.fromJson(jsonDecode(response.body));
    }
    throw Exception("Không thể tải thông tin user");
  }

  Future<bool> updateUser(String id, UserModel user) async {
    final response = await http.put(
      Uri.parse("${AppConstants.baseUrl}/users/$id"),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode(user.toJson()),
    );
    return response.statusCode == 200;
  }
}