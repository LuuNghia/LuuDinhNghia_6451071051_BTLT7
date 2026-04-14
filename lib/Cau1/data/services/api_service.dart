import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/user_model.dart';
import '../../utils/constants.dart';

class UserApiService {
  Future<List<User>> fetchUsers() async {
    final String endpoint = '${AppConstants.baseUrl}/users';
    
    final response = await http.get(Uri.parse(endpoint));

    if (response.statusCode == 200 || response.statusCode == 201) {
      List<dynamic> jsonResponse = json.decode(response.body);
      return jsonResponse.map((data) => User.fromJson(data)).toList();
    } else {
      throw Exception('Lỗi khi tải danh sách người dùng: ${response.statusCode}');
    }
  }
}