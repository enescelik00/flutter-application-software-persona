// test/product_test.dart
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_application/models/product.dart';

void main() {
  group('Product Model Testi', () {
    test('JSON verisi başarılı bir şekilde Product nesnesine dönüşmeli', () {
      // JSON data Sample
      final Map<String, dynamic> json = {
        "id": 1,
        "title": "Test Çantası",
        "price": 109.95,
        "description": "Bu bir test ürünüdür.",
        "category": "men's clothing",
        "image": "https://fakestoreapi.com/img/81fPKd-2AYL._AC_SL1500_.jpg",
        "rating": {"rate": 3.9, "count": 120},
      };

      // Send data to our model
      final product = Product.fromJson(json);

      // Check (Expectations)
      expect(product.id, 1); // ID needs to be 1
      expect(product.title, "Test Çantası"); // Name needs to be correct
      expect(product.price, 109.95); // Price needs to be correct

      // Check price (double or not)
      expect(product.price, isA<double>());
    });
  });
}
