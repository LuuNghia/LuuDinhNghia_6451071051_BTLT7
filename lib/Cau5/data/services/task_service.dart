import 'package:http/http.dart' as http;
import 'dart:convert';
import '../../utils/constants.dart';
import '../models/task_model.dart';

class TaskService {
  final String _url = "${AppConstants.baseUrl}/tasks";

  Future<List<Task>> fetchTasks() async {
    final response = await http.get(Uri.parse(_url));
    if (response.statusCode == 200) {
      List data = jsonDecode(response.body);
      return data.map((item) => Task.fromJson(item)).toList();
    }
    throw Exception("Lỗi tải danh sách");
  }

  Future<bool> deleteTask(String id) async {
    final response = await http.delete(Uri.parse("$_url/$id"));
    return response.statusCode == 200;
  }
}