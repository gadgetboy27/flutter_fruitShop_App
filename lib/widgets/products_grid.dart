import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/providers/products.dart';
import 'package:provider/provider.dart';
import '../widgets/product_item.dart';

class ProductsGrid extends StatelessWidget {
  final bool _showAll;

  ProductsGrid(this._showAll);

  @override
  Widget build(BuildContext context) {
    final productsProvider = Provider.of<Products>(context);
    final loadedProducts =
        _showAll ? productsProvider.products : productsProvider.favorites;
    return GridView.builder(
      padding: const EdgeInsets.all(20.0),
      itemCount: loadedProducts.length,
      itemBuilder: (context, i) => ChangeNotifierProvider.value(
        value: loadedProducts[i],
        child: ProductItem(),
      ),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 2 / 2,
        crossAxisSpacing: 15,//space between rows
        mainAxisSpacing: 20,//space between columns
      ),
    );
  }
}
