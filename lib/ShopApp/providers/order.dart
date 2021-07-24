import 'package:flutter/cupertino.dart';

import 'cart.dart';

class OrderItem {
  final String id;
  final double amount;
  final List<CartItem> cartItemList;
  final DateTime dateTime = DateTime.now();

  OrderItem({
    required this.id,
    required this.amount,
    required this.cartItemList,
  });
}

class Order with ChangeNotifier {
  late List<OrderItem> _orderList = [];

  List<OrderItem> get orderList => this._orderList;

  void addOrder(List<CartItem> cartItemList){
    double totalPrice = 0;
    cartItemList.forEach((element) {
      totalPrice += element.price*element.quantity;
    });

    _orderList.add(OrderItem(id: DateTime.now().toString(), amount: totalPrice, cartItemList: cartItemList));
  }

}
