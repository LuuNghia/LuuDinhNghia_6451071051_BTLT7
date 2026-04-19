class Product {
  final String id;
  final String title;
  final String price;
  final String description;

  Product({
    required this.id, 
    required this.title, 
    required this.price, 
    required this.description
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'] ?? '',
      title: json['title'] ?? '',
      price: json['price'] ?? '',
      description: json['description'] ?? '',
    );
  }
}