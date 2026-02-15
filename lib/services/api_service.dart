// lib/services/api_service.dart
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/product.dart';

class ApiService {
  // Fake Store API address
  final String baseUrl = "https://fakestoreapi.com/products";

  Future<List<Product>> fetchProducts() async {
    try {
      final response = await http.get(Uri.parse(baseUrl));

      if (response.statusCode == 200) {
        List<dynamic> body = jsonDecode(response.body);

        // JSON to Product List
        List<Product> products = body
            .map((dynamic item) => Product.fromJson(item))
            .toList();

        return products;
      } else {
        throw Exception('Veri yüklenemedi: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Hata oluştu: $e');
    }
  }
}
