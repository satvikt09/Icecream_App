// lib/views/cart_screen.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:app/providers/cart_provider.dart';

class CartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartProvider>(context);

    return Scaffold(
      appBar: AppBar(title: Text('Your Cart')),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: cart.items.length,
              itemBuilder: (context, index) {
                final item = cart.items[index];
                return ListTile(
                  title: Text(item.icecream.flavor),
                  subtitle: Text('Quantity: ${item.quantity}'),
                  trailing: Text('Rs ${item.icecream.price * item.quantity}'),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Total: Rs ${cart.totalAmount.toStringAsFixed(2)}',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                ElevatedButton(
                  onPressed: () {
                    _showCheckoutDialog(context, cart.totalAmount);
                  },
                  child: Text('Checkout'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _showCheckoutDialog(BuildContext context, double totalAmount) {
    final cart = Provider.of<CartProvider>(context,
        listen: false); // Get the CartProvider instance

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Thank You!'),
          content: Text(
              'Your total bill is Rs ${totalAmount.toStringAsFixed(2)}. Thank you for your purchase!'),
          actions: [
            TextButton(
              child: Text('OK'),
              onPressed: () {
                cart.clearCart(); // Clear the cart when OK is pressed
                Navigator.of(context).pop(); // Close the dialog
                Navigator.of(context).pushNamedAndRemoveUntil(
                    '/', (route) => false); // Navigate to home page
              },
            ),
          ],
        );
      },
    );
  }
}
