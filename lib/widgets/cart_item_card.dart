// lib/widgets/cart_item_card.dart
import 'package:flutter/material.dart';
import '../models/product.dart';

class CartItemCard extends StatelessWidget {
  final Product product;
  final int quantity;
  final VoidCallback onAdd;
  final VoidCallback onRemove;

  const CartItemCard({
    super.key,
    required this.product,
    required this.quantity,
    required this.onAdd,
    required this.onRemove,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 15),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      elevation: 0,
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Row(
          children: [
            // Image Area
            Container(
              width: 70,
              height: 70,
              padding: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey.shade100),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Image.network(product.image, fit: BoxFit.contain),
            ),

            const SizedBox(width: 15),

            // Text and Price Area
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product.title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    "\$${(product.price * quantity).toStringAsFixed(2)}",
                    style: const TextStyle(
                      color: Color(0xFFFF7043),
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),

            // Butons
            Row(
              children: [
                IconButton(
                  icon: const Icon(
                    Icons.remove_circle_outline,
                    color: Colors.grey,
                  ),
                  onPressed: onRemove,
                ),
                Text(
                  "$quantity",
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.add_circle, color: Color(0xFFFF7043)),
                  onPressed: onAdd,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
