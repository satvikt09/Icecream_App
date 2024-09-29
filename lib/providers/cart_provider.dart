// lib/providers/cart_provider.dart
import 'package:app/icecream/icecream.dart';
import 'package:app/models/cart.dart';
import 'package:flutter/material.dart';

class CartProvider with ChangeNotifier {
  List<CartItem> _items = [];

  List<CartItem> get items => _items;

  void addToCart(Icecream icecream) {
    final existingItem = _items.firstWhere(
      (item) => item.icecream.flavor == icecream.flavor,
      orElse: () => CartItem(icecream: icecream, quantity: 0),
    );

    if (existingItem.quantity > 0) {
      existingItem.quantity++;
    } else {
      _items.add(CartItem(icecream: icecream));
    }

    notifyListeners();
  }

  void removeFromCart(Icecream icecream) {
    _items.removeWhere((item) => item.icecream.flavor == icecream.flavor);
    notifyListeners();
  }

  void clearCart() {
    _items.clear(); // Clear the cart items
    notifyListeners(); // Notify listeners for UI updates
  }

  int get totalItems => _items.fold(0, (sum, item) => sum + item.quantity);

  double get totalAmount => _items.fold(
      0,
      (sum, item) =>
          sum +
          (item.icecream.price *
              item.quantity)); // Add this line to calculate the total amount
}
