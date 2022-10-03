import 'package:flutter/material.dart' show AppBar, BuildContext, Card, Chip, Colors, Column, EdgeInsets, Expanded, ListView, MainAxisAlignment, Padding, Row, Scaffold, ScaffoldMessenger, SizedBox, SnackBar, Spacer, StatelessWidget, Text, TextButton, TextStyle, Widget;
import 'package:provider/provider.dart';

import '../widgets/cart_item.dart';
import '../providers/cart.dart' show Cart;
import '../providers/orders.dart';

class CartScreen extends StatelessWidget {
  static const route = '/your-cart';

  @override
  Widget build(BuildContext context) {
    var cart = Provider.of<Cart>(context);
    var orders = Provider.of<Orders>(context);
    var items = cart.items.values.toList();
    var total = cart.totalAmount;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Cart'),
      ),
      body: Column(
        children: [
          Card(
            margin: EdgeInsets.all(15),
            child: Padding(
              padding: EdgeInsets.all(8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Total',
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  Spacer(),
                  // Chip(
                  //   label: Text(
                  //     'Click Here ->',
                  //     style: TextStyle(color: Colors.black
                  //         // Theme.of(context).primaryTextTheme.headline6.color,
                  //         ),
                  //   ),
                  //   // backgroundColor: Theme.of(context).primaryColor,
                  // ),
                  TextButton(
                    onPressed: () {
                      if (items.length > 0) {
                        orders.addOrder(items, total);
                        cart.clear();
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            duration: Duration(seconds: 2),
                            content: Text(
                              'Order Successful!',
                              style: TextStyle(
                                color: Colors.green,
                              ),
                            ),
                          ),
                        );
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            duration: Duration(seconds: 2),
                            content: Text(
                              'No products in the cart!',
                              style: TextStyle(
                                color: Colors.red,
                              ),
                            ),
                          ),
                        );
                      }
                    },
                    child: Chip(
                      label: Text(
                      'Click to Order \$ $total',
                      // style: TextStyle(
                      //   color: Colors.black,
                      //   // backgroundColor: Theme.of(context).
                      //   // primaryTextTheme.headline6.color
                      //     ),
                        ),
                      ),
                    ),
                  // ),
                ],
              ),
            ),
          ),
          SizedBox(height: 10),
          Expanded(
            child: ListView.builder(
              itemBuilder: (context, index) {
                return CartItem(
                  id: items[index].id,
                  title: items[index].title,
                  productId: cart.items.keys.toList()[index],
                  quantity: items[index].quantity,
                  price: items[index].price,
                  image:items[index].image,
                );
              },
              itemCount: cart.items.length,
            ),
          ),
        ],
      ),
    );
  }
}
