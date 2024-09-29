import 'package:app/models/cart_item.dart'; // Import your CartItem
import 'package:flutter/material.dart';
import '../icecream/icecream.dart'; // Import your Icecream model

class CartProvider with ChangeNotifier {
  List<CartItem> _items = [];

  List<CartItem> get items => _items;

  void addToCart(Icecream icecream) {
    // Check for existing item
    final existingItem = _items.firstWhere(
      (item) => item.icecream.flavor == icecream.flavor,
      orElse: () => CartItem(icecream: icecream, quantity: 0), // Default item
    );

    if (existingItem.quantity > 0) {
      // If item exists, increase quantity
      existingItem.quantity++;
    } else {
      // If item doesn't exist, create a new CartItem
      _items.add(CartItem(
          icecream: icecream, quantity: 1)); // Add new item with quantity
    }

    notifyListeners();
  }

  void removeFromCart(Icecream icecream) {
    _items.removeWhere((item) => item.icecream.flavor == icecream.flavor);
    notifyListeners();
  }

  int get totalItems => _items.fold(0, (sum, item) => sum + item.quantity);
}
