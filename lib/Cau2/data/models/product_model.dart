class Product {
  final int id;
  final String title;
  final double price;
  final String description;

  Product({
    required this.id,
    required this.title,
    required this.price,
    required this.description,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: int.tryParse(json['id'].toString()) ?? 0,
      title: json['name'] ?? json['title'] ?? 'Không có tên',
      price: double.tryParse(json['price'].toString()) ?? 0.0,
      description: json['description'] ?? 'Không có mô tả',
    );
  }
}
