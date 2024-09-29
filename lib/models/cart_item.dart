import 'package:app/icecream/icecream.dart';

class CartItem {
  final Icecream icecream;
  int quantity;

  CartItem({
    required this.icecream,
    this.quantity = 1,
  });
}
