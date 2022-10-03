import 'package:flutter/material.dart';
import '../providers/product.dart';

class Products with ChangeNotifier {
  final List<Product> _products = [
    Product(
      id: 'p1',
      title: 'APPLE',
      description: 'The Red One',
      price: 29,
      image:'assets/images/apple.png',
    ),
    Product(
      id: 'p2',
      title: 'BANANA',
      description: 'The Yellow One',
      price: 59,
      image:'assets/images/banana.png',
    ),
    Product(
      id: 'p3',
      title: 'PAPAYA',
      description: 'The Mixed One',
      price: 19,
      image:'assets/images/papaya.png',
    ),
    Product(
      id: 'p4',
      title: 'PINAPPLE',
      description: 'The Green Top',
      price: 49,
      image:'assets/images/pineapple.png',
    ),
    Product(
      id: 'p5',
      title: 'ORANGE',
      description: 'The Orange One',
      price: 89,
      image:'assets/images/orange.png',
    ),
  ];

  List<Product> get products {
    return [..._products];
  }

  List<Product> get favorites {
    return _products.where((product) => product.isFavorite).toList();
  }

  Product findById(String id) {
    return _products.firstWhere((element) => element.id == id);
  }

  void addProduct(Product product) {
    _products.add(product);
    notifyListeners();
  }
}
