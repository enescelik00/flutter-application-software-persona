// lib/screens/home_screen.dart
import 'package:flutter/material.dart';
import '../models/product.dart';
import '../services/api_service.dart';
import '../widgets/product_card.dart';
import '../widgets/home_banner.dart';
import '../widgets/home_search_bar.dart';
import 'cart_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ApiService _apiService = ApiService();
  List<Product> _allProducts = [];
  List<Product> _filteredProducts = [];
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadProducts();
  }

  Future<void> _loadProducts() async {
    try {
      final products = await _apiService.fetchProducts();
      setState(() {
        _allProducts = products;
        _filteredProducts = products;
        _isLoading = false;
      });
    } catch (e) {
      setState(() => _isLoading = false);
    }
  }

  void _runFilter(String keyword) {
    List<Product> results = [];
    if (keyword.isEmpty) {
      results = _allProducts;
    } else {
      results = _allProducts
          .where(
            (product) =>
                product.title.toLowerCase().contains(keyword.toLowerCase()),
          )
          .toList();
    }
    setState(() => _filteredProducts = results);
  }

  @override
  Widget build(BuildContext context) {
    // Total number of items in the cart (for the badge)
    int cartItemCount = globalCart.length;

    return Scaffold(
      // AppBar
      appBar: AppBar(
        titleSpacing: 20,
        title: const Row(
          children: [
            Icon(Icons.bolt_rounded, color: Color(0xFFFF7043), size: 32),
            SizedBox(width: 8),
            Text(
              "Swift Shop",
              style: TextStyle(
                fontWeight: FontWeight.w900,
                fontSize: 24,
                color: Color(0xFF263238),
                letterSpacing: -0.5,
              ),
            ),
          ],
        ),
        actions: [
          // Cart Icon (with badge)
          Padding(
            padding: const EdgeInsets.only(right: 20, top: 5),
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const CartScreen(),
                      ),
                    ).then((_) => setState(() {}));
                  },
                  child: const Icon(
                    Icons.shopping_cart_outlined,
                    size: 28,
                    color: Color(0xFF263238),
                  ),
                ),

                if (cartItemCount > 0)
                  Positioned(
                    right: -3,
                    top: -3,
                    child: Container(
                      padding: const EdgeInsets.all(4),
                      decoration: const BoxDecoration(
                        color: Color(0xFFFF7043),
                        shape: BoxShape.circle,
                      ),
                      child: Text(
                        '$cartItemCount',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),

      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : Column(
              children: [
                // Search Bar (Widget)
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                  child: HomeSearchBar(onSearch: _runFilter),
                ),

                // Banner (Widget)
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: HomeBanner(),
                ),

                const SizedBox(height: 15),

                // Product List
                Expanded(
                  child: _filteredProducts.isEmpty
                      ? const Center(child: Text("Ürün bulunamadı"))
                      : GridView.builder(
                          physics: const BouncingScrollPhysics(),
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                childAspectRatio: 0.68,
                                crossAxisSpacing: 15,
                                mainAxisSpacing: 15,
                              ),
                          itemCount: _filteredProducts.length,
                          itemBuilder: (context, index) {
                            return ProductCard(
                              product: _filteredProducts[index],
                            );
                          },
                        ),
                ),
              ],
            ),
    );
  }
}
