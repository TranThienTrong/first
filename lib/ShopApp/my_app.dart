import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:projects/ShopApp/models/product.dart';
import 'package:projects/ShopApp/providers/auth.dart';
import 'package:projects/ShopApp/providers/cart.dart';
import 'package:projects/ShopApp/providers/order.dart';
import 'package:projects/ShopApp/providers/product_provider.dart';
import 'package:projects/ShopApp/screens/add_user_product_screen.dart';
import 'package:projects/ShopApp/screens/auth_screen.dart';
import 'package:projects/ShopApp/screens/edit_user_product_screen.dart';
import 'package:projects/ShopApp/screens/order_screen.dart';
import 'package:projects/ShopApp/screens/cart_screen.dart';
import 'package:projects/ShopApp/screens/product_detail_screen.dart';
import 'package:projects/ShopApp/screens/product_overview_screen.dart';
import 'package:projects/ShopApp/screens/user_product_screen.dart';
import 'package:projects/ShopApp/widgets/product_item.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => Auth()),
        //ChangeNotifierProxyProvider<Auth>( create: (context) => ProductProvider(), update:(context,) ,),
        ChangeNotifierProvider(create: (context) => ProductProvider()),
        ChangeNotifierProvider(create: (context) => Cart(ProductProvider())),
        ChangeNotifierProvider(create: (context) => Order()),
      ],
      child: Consumer<Auth>(
        builder: (context, auth, _) =>
            MaterialApp(
                theme: ThemeData(
                    primarySwatch: Colors.deepPurple,
                    accentColor: Colors.amber,
                    fontFamily: 'Lato',
                    textTheme: ThemeData
                        .light()
                        .textTheme
                        .copyWith(
                        caption: TextStyle(color: Colors.white),
                        button: TextStyle(color: Colors.white))),
                home: auth.isLogined
                    ? ProductOverviewScreen()
                    : (auth.autoLogin()==true?ProductOverviewScreen():AuthScreen()),

                // FutureBuilder(future: auth.autoLogin(),
                //   builder: (context, snapshot) {
                //     return AuthScreen();
                //   },),
                routes: setRouteTable(context)
            ),
      ),);
  }
}

Map<String, Widget Function(BuildContext)> setRouteTable(BuildContext context) {
  return {
    'main_screen': (context) => ProductOverviewScreen(),
    'product_detail_screen': (context) => ProductDetailScreen(),
    'cart_screen': (context) => CartScreen(),
    'order_screen': (context) => OrderScreen(),
    'user_product_screen': (context) => UserProductScreen(),
    'edit_user_product_screen': (context) => EditUserProductScreen(),
    'add_user_product_screen': (context) => AddUserProductScreen(),
    'auth_screen': (context) => AuthScreen(),
  };
}

void main(List<String> args) {
  runApp(MyApp());
}
