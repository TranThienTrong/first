import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:projects/ShopApp/providers/cart.dart';
import 'package:projects/ShopApp/widgets/cart_item_widget.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Cart cartProvider = Provider.of<Cart>(context);
    Map<String,CartItem> cartItemList = cartProvider.cartItemList;

    print(cartItemList[0]);


    return Scaffold(
        appBar: AppBar(title: Text('Your Cart')),
        body: Column(children: <Widget>[
          Expanded(
              child: ListView.builder(
                  itemBuilder: (context, index) {
                    return CartItemWidget(cartProvider.cartItemList.keys.toList()[index],cartProvider.cartItemList.values.toList()[index]);
                  },
                  itemCount: cartProvider.cartItemList.length)),
          Expanded(
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
          Expanded(
            child: Container(
                margin: EdgeInsets.symmetric(horizontal: 10),
                alignment: Alignment.centerRight,
                child:
                    ElevatedButton(onPressed: () {}, child: Text('ORDER NOW'))),
          )
        ]));
  }
}
