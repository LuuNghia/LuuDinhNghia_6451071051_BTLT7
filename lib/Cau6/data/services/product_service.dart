import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../utils/constants.dart';
import '../models/product_model.dart';

class ProductService {
  Future<List<Product>> searchProducts(String keyword) async {
    final response = await http.get(
      Uri.parse("${AppConstants.baseUrl}/products?title=$keyword"),
    );

    if (response.statusCode == 200) {
      List data = jsonDecode(response.body);
      return data.map((item) => Product.fromJson(item)).toList();
    } else {
      return []; 
    }
  }
}