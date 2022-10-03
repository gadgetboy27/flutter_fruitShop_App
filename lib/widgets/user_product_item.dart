import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/providers/cart.dart';
import 'package:flutter_complete_guide/providers/product.dart';
import 'package:provider/provider.dart';

class UserProductItem extends StatelessWidget {
  final String title;
  final String image;

  UserProductItem(this.title, this.image);

  @override
  Widget build(BuildContext context) {
        final cart = Provider.of<Cart>(context);
        final product = Provider.of<Product>(context);
    return ListTile(
      title: Text(title),
      leading: CircleAvatar(
        backgroundImage: AssetImage(image),
      ),
      trailing: Container(
        width: 100,
        child: Row(
          children: [
            IconButton(
              icon: Icon(Icons.edit),
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(Icons.delete),
              onPressed: () {
                cart.removeItem(product.id);
              },
              // },
            ),
          ],
        ),
      ),
    );
  }
}
