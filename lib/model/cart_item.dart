import 'package:flutter/foundation.dart';

class CartItem {
  final String id;
  final String title;
  final String image;
  int quantity;
  double price;

  CartItem({
    @required this.image,
    @required this.id,
    @required this.title,
    @required this.quantity,
    @required this.price,
  });
}
