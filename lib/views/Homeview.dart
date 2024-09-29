// lib/views/HomeView.dart
import 'package:app/views/IcecreamView.dart';
import 'package:flutter/material.dart';
import 'cart_screen.dart'; // Ensure you have this import if you are using CartScreen

class HomeView extends StatelessWidget {
  // Ensure this class is declared correctly
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ice Cream Shop'),
        actions: [
          IconButton(
            icon: Icon(Icons.shopping_cart),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => CartScreen()),
              );
            },
          ),
        ],
      ),
      body: SafeArea(
        child: IcecreamView(), // Ensure IcecreamView is correctly imported
      ),
    );
  }
}
