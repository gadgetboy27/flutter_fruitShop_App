import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/products.dart';

class ProductDetailScreen extends StatelessWidget {
  static final route = '/product-detail';

  @override
  Widget build(BuildContext context) {
    final productId = ModalRoute.of(context).settings.arguments as String;
    final product = Provider.of<Products>(
      context,
      listen: false,
    ).findById(productId);

    return Scaffold(
      appBar: AppBar(
        title: Text(product.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: 300,
              child: Image.asset(
                product.image,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: 30),
            Text('\$ ${product.price}'),
            SizedBox(height: 30),
            Text(
              '${product.description}',
              textAlign: TextAlign.center,
            )
          ],
        ),
      ),
    );
  }
}
