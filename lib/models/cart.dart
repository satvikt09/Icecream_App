// lib/models/cart.dart
import 'cart_item.dart'; // Import the CartItem class
import 'package:app/icecream/icecream.dart';

class Cart {
  List<CartItem> items = []; // List to hold CartItems

  void addToCart(Icecream icecream) {
    // Check if the ice cream is already in the cart
    final existingItem = items.firstWhere(
      (item) => item.icecream.flavor == icecream.flavor,
      orElse: () =>
          CartItem(icecream: icecream, quantity: 0), // Default CartItem
    );

    if (existingItem.quantity > 0) {
      existingItem.quantity++; // Increase quantity if already in the cart
    } else {
      items.add(CartItem(icecream: icecream)); // Add new item if not in cart
    }
  }

  void removeFromCart(Icecream icecream) {
    final existingItem = items.firstWhere(
      (item) => item.icecream.flavor == icecream.flavor,
      orElse: () =>
          CartItem(icecream: icecream, quantity: 0), // Default CartItem
    );

    if (existingItem.quantity > 1) {
      existingItem.quantity--; // Decrease quantity by 1
    } else if (existingItem.quantity == 1) {
      items.remove(existingItem); // Remove the item completely if quantity is 1
    }
  }
}
