import 'package:uuid/uuid.dart';
import 'package:flutter/foundation.dart';

import '../model/cart_item.dart';
import '../providers/product.dart';

class Cart with ChangeNotifier {
  Map<String, CartItem> _cartItemByProductId = {};

  Map<String, CartItem> get items {
    return {..._cartItemByProductId};
  }

  void addItem(Product product) {
    _cartItemByProductId.putIfAbsent(
        product.id,
        () => CartItem(
            id: Uuid().toString(),
            title: product.title,
            quantity: 0,
            price: product.price, image: ''));

    _cartItemByProductId[product.id].quantity++;
    notifyListeners();
  }

  double get totalAmount {
    var total = 0.0;
    _cartItemByProductId.forEach((key, item) {
      total += item.price * item.quantity;
    });

    return total;
  }

  void removeItem(String productId) {
    _cartItemByProductId.remove(productId);
    notifyListeners();
  }

  void removeSingleItem(String productId) {
    if (_cartItemByProductId[productId].quantity > 1) {
      _cartItemByProductId[productId].quantity--;
      notifyListeners();
    } else {
      removeItem(productId);
    }
  }

  int get itemsCount {
    return _cartItemByProductId.isEmpty
        ? 0
        : _cartItemByProductId.values
            .map((cartItem) => cartItem.quantity)
            .reduce((a, b) => a + b);
  }

  void clear() {
    _cartItemByProductId = {};
    notifyListeners();
  }
}
