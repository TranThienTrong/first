import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:projects/ShopApp/providers/cart.dart';
import 'package:projects/ShopApp/providers/order.dart';
import 'package:projects/ShopApp/providers/product_provider.dart';
import 'package:projects/ShopApp/widgets/app_drawer.dart';
import 'package:projects/ShopApp/widgets/cart_item_widget.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    Order orderProvider = Provider.of<Order>(context);
    ProductProvider productProvider = Provider.of<ProductProvider>(context);
    Cart cartProvider = Provider.of<Cart>(context);

    Map<String, CartItem> cartItemList = cartProvider.cartItemList;

    print(cartItemList[0]);

    return Scaffold(
        appBar: AppBar(title: Text('Your Cart')),
        drawer: AppDrawer(),
        body: Column(children: <Widget>[
          Expanded(
              flex: 4,
              child: ListView.builder(
                  itemBuilder: (context, index) {
                    return CartItemWidget(
                        cartProvider.cartItemList.keys.toList()[index],
                        cartProvider.cartItemList.values.toList()[index]);
                  },
                  itemCount: cartProvider.cartItemList.length)),
          Expanded(
            flex: 1,
            child: Card(
              margin: EdgeInsets.all(10),
              child: Container(
                  padding: EdgeInsets.all(10),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text('Total'),
                        SizedBox(width: 10),
                        Chip(
                            label: Text('\$${cartProvider.totalPrice}'),
                            labelStyle: TextStyle(color: Colors.white),
                            backgroundColor: Theme.of(context).primaryColor)
                      ])),
            ),
          ),
          Container(
              margin: EdgeInsets.symmetric(horizontal: 10),
              alignment: Alignment.centerRight,
              child: ElevatedButton(
                  onPressed: () {
                    orderProvider.addOrder(cartItemList.values.toList());
                    Navigator.of(context).pushNamed('order_screen');
                    cartProvider.clear();
                  },
                  child: Text('ORDER NOW'))),
        ]));
  }
}
