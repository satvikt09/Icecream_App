// lib/views/cart_screen.dart
import 'package:flutter/material.dart';
import 'package:app/models/cart.dart';
// ignore: unused_import
import 'package:app/models/cart_item.dart';

class CartScreen extends StatelessWidget {
  final Cart cart;

  CartScreen({required this.cart});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cart'),
      ),
      body: ListView.builder(
        itemCount: cart.items.length,
        itemBuilder: (context, index) {
          final item = cart.items[index];
          return ListTile(
            title: Text(item.icecream.flavor),
            subtitle: Text('Quantity: ${item.quantity}'),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  icon: Icon(Icons.remove),
                  onPressed: () {
                    cart.removeFromCart(
                        item.icecream); // Call to remove from cart
                    // Refresh UI if needed, you might want to use a StatefulWidget
                  },
                ),
                IconButton(
                  icon: Icon(Icons.add),
                  onPressed: () {
                    cart.addToCart(item.icecream); // Call to add to cart
                    // Refresh UI if needed
                  },
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
