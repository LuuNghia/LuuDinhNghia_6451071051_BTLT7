import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../utils/constants.dart';
import '../models/product_model.dart';

class ProductService {
  Future<Product> fetchProductDetail(String id) async {
    final response = await http.get(
      Uri.parse("${AppConstants.baseUrl}/products/$id"),
    );

    if (response.statusCode == 200) {
      return Product.fromJson(jsonDecode(response.body));
    } else {
      throw Exception("Failed to load product");
    }
  }
}