import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:projects/ShopApp/data/product.dart';
import 'package:projects/ShopApp/providers/cart.dart';
import 'package:projects/ShopApp/providers/product_provider.dart';
import 'package:projects/ShopApp/screens/cart_screen.dart';
import 'package:projects/ShopApp/screens/product_detail_screen.dart';
import 'package:projects/ShopApp/screens/product_overview_screen.dart';
import 'package:projects/ShopApp/widgets/product_item.dart';
import 'package:provider/provider.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ProductProvider()),
        ChangeNotifierProvider(create: (context) => Cart())
      ],
      child: MaterialApp(
        theme: ThemeData(
            primarySwatch: Colors.deepPurple,
            accentColor: Colors.amber,
            fontFamily: 'Lato',
            textTheme: ThemeData.light().textTheme.copyWith(
                caption: TextStyle(color: Colors.white),
                button: TextStyle(color: Colors.white))),
        home: ProductOverviewScreen(),
        initialRoute: 'main_screen',
        routes: setRouteTable(context),
      ),
    );
  }
}

Map<String, Widget Function(BuildContext)> setRouteTable(BuildContext context) {
  return {
    'product_detail_screen': (context) => ProductDetailScreen(),
    'cart_screen': (context) => CartScreen()
  };
}

void main(List<String> args) {
  runApp(MyApp());
}
