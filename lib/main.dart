
import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/providers/product.dart';
import 'package:flutter_complete_guide/screens/cart_screen.dart';
import 'package:flutter_complete_guide/screens/orders_screen.dart';
import 'package:flutter_complete_guide/screens/user_products_screen.dart';
import 'package:provider/provider.dart';
import './screens/product_detail_screen.dart';
import './screens/products_overview_screen.dart';
import './providers/cart.dart';
import './providers/products.dart';
import './providers/orders.dart';

void main() => runApp(
  ChangeNotifierProvider(
      create: (BuildContext context) =>Cart(),
      child:MyApp(),
      )
    );
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => Products(),
        ),
        ChangeNotifierProvider(
          create: (context) => Cart(),
        ),
        ChangeNotifierProvider(
          create: (context) => Orders(),
        ),
        ChangeNotifierProvider(
          create: (context) => Product(
            price: 1.0, 
            id: '', 
            title: '', 
            image: '',
            description: '',),
        ),
      ],
      child: MaterialApp(
        title: 'MyShop',
        theme: ThemeData(
            fontFamily: 'Lato',
          colorScheme: ColorScheme
          .fromSwatch(primarySwatch: Colors.pink)
          .copyWith(secondary: Colors.greenAccent),
        ),
        home: ProductsOverviewScreen(),
        routes: {
          ProductDetailScreen.route: (context) => ProductDetailScreen(),
          CartScreen.route: (context) => CartScreen(),
          OrdersScreen.route: (context) => OrdersScreen(),
          UserProductsScreen.route: (context) => UserProductsScreen(),
        },
      ),
    );
  }
}
