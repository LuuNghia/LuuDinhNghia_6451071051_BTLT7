import 'package:flutter/material.dart';
import '../../data/models/user_model.dart';
import '../../data/services/user_service.dart';

class UserEditForm extends StatefulWidget {
  const UserEditForm({super.key});

  @override
  State<UserEditForm> createState() => _UserEditFormState();
}

class _UserEditFormState extends State<UserEditForm> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _avatarController = TextEditingController();
  final _userService = UserService();
  bool _isLoading = true;
  String userId = "1"; 

  @override
  void initState() {
    super.initState();
    _loadUserData();
  }

  void _loadUserData() async {
    try {
      UserModel user = await _userService.getUser(userId);
      _nameController.text = user.name;
      _avatarController.text = user.avatar;
      setState(() => _isLoading = false);
    } catch (e) {
      print("Lỗi load data: $e");
    }
  }

  void _handleUpdate() async {
    if (_formKey.currentState!.validate()) {
      final updatedUser = UserModel(
        id: userId,
        name: _nameController.text,
        avatar: _avatarController.text,
      );

      bool success = await _userService.updateUser(userId, updatedUser);

      if (success) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Cập nhật thành công!")),
        );
        print("Dữ liệu mới: ${_nameController.text}");
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Chỉnh sửa hồ sơ")),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
              padding: const EdgeInsets.all(16.0),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    const Text(
                      "Lưu Đình Nghĩa - 6451071051",
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                    const SizedBox(height: 20),
                    TextFormField(
                      controller: _nameController,
                      decoration: const InputDecoration(labelText: "Họ và tên", border: OutlineInputBorder()),
                      validator: (value) => value!.isEmpty ? "Không được để trống" : null,
                    ),
                    const SizedBox(height: 15),
                    TextFormField(
                      controller: _avatarController,
                      decoration: const InputDecoration(labelText: "Link ảnh đại diện", border: OutlineInputBorder()),
                    ),
                    const SizedBox(height: 30),
                    ElevatedButton(
                      onPressed: _handleUpdate,
                      style: ElevatedButton.styleFrom(minimumSize: const Size(double.infinity, 50)),
                      child: const Text("Cập nhật thông tin"),
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}