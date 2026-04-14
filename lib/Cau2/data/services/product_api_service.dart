import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/product_model.dart';
import '../../utils/constants.dart';

class ProductApiService {
  Future<List<Product>> fetchProducts() async {
    final String endpoint = '${AppConstants.baseUrl}/products';
    
    final response = await http.get(Uri.parse(endpoint));

    if (response.statusCode == 200 || response.statusCode == 201) {
      List<dynamic> jsonResponse = json.decode(response.body);
      return jsonResponse.map((data) => Product.fromJson(data)).toList();
    } else {
      throw Exception('Lỗi khi tải danh sách sản phẩm: ${response.statusCode}');
    }
  }

  Future<Product> fetchProductDetail(int productId) async {
    final String endpoint = '${AppConstants.baseUrl}/products/$productId';
    
    final response = await http.get(Uri.parse(endpoint));

    if (response.statusCode == 200 || response.statusCode == 201) {
      Map<String, dynamic> jsonResponse = json.decode(response.body);
      return Product.fromJson(jsonResponse);
    } else {
      throw Exception('Lỗi khi tải chi tiết sản phẩm: ${response.statusCode}');
    }
  }
}
