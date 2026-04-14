class User {
  final int id;
  final String name;
  final String email;

  User({required this.id, required this.name, required this.email});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: int.tryParse(json['id'].toString()) ?? 0, 
      
      name: json['name'] ?? 'Không có tên',
      email: json['email'] ?? 'Không có email',
    );
  }
}