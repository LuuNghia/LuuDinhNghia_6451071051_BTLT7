class Product {
  final String id;
  final String title;

  Product({required this.id, required this.title});

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'] ?? '',
      title: json['title'] ?? '',
    );
  }
}