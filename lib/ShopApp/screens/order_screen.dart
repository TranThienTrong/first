import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:projects/ShopApp/providers/order.dart';
import 'package:projects/ShopApp/widgets/app_drawer.dart';
import 'package:projects/ShopApp/widgets/order_item_widget.dart';
import 'package:provider/provider.dart';

class OrderScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Order orderProvider = Provider.of<Order>(context);

    return Scaffold(
        appBar: AppBar(title: Text('Orders')),
        drawer: AppDrawer(),
        body: ListView.builder(
            itemBuilder: (context, index) {
              return OrderItemWidget(orderProvider.orderList[index]);
            },
            itemCount: orderProvider.orderList.length));
  }
}
