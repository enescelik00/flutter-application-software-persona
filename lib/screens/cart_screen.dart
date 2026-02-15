// lib/screens/cart_screen.dart
import 'package:flutter/material.dart';
import '../models/product.dart';
import '../widgets/cart_item_card.dart';
import '../widgets/cart_bottom_bar.dart';

// Global cart list
List<Product> globalCart = [];

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  // Calculate total price
  double get totalPrice => globalCart.fold(0, (sum, item) => sum + item.price);

  // Group the products
  Map<int, int> get productCounts {
    var counts = <int, int>{};
    for (var product in globalCart) {
      counts[product.id] = (counts[product.id] ?? 0) + 1;
    }
    return counts;
  }

  // Find the product by ID
  Product getProductById(int id) => globalCart.firstWhere((p) => p.id == id);

  @override
  Widget build(BuildContext context) {
    final uniqueProductIds = productCounts.keys.toList();

    return Scaffold(
      backgroundColor: const Color(0xFFF5F7FA),
      appBar: AppBar(
        title: const Text(
          "Sepetim",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      // If the cart is empty, show a sad icon; if it is full, display the list
      body: globalCart.isEmpty
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.shopping_cart_outlined,
                    size: 80,
                    color: Colors.grey[300],
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    "Sepetiniz henüz boş 😔",
                    style: TextStyle(fontSize: 18, color: Colors.grey),
                  ),
                ],
              ),
            )
          : Column(
              children: [
                // List Area
                Expanded(
                  child: ListView.builder(
                    padding: const EdgeInsets.all(20),
                    itemCount: uniqueProductIds.length,
                    itemBuilder: (context, index) {
                      final productId = uniqueProductIds[index];
                      final product = getProductById(productId);
                      final count = productCounts[productId]!;

                      // Component: CartItemCard
                      return CartItemCard(
                        product: product,
                        quantity: count,
                        onAdd: () {
                          setState(() {
                            globalCart.add(product);
                          });
                        },
                        onRemove: () {
                          setState(() {
                            final indexToRemove = globalCart.indexWhere(
                              (p) => p.id == productId,
                            );
                            if (indexToRemove != -1) {
                              globalCart.removeAt(indexToRemove);
                            }
                          });
                        },
                      );
                    },
                  ),
                ),

                // Component: BottomBar
                CartBottomBar(
                  totalPrice: totalPrice,
                  onCheckout: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text("Sipariş alındı! (Demo)")),
                    );
                  },
                ),
              ],
            ),
    );
  }
}
