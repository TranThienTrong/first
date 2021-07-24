import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:projects/ShopApp/providers/cart.dart';
import 'package:projects/ShopApp/providers/order.dart';
import 'package:provider/provider.dart';

class OrderItemWidget extends StatefulWidget {
  OrderItem orderItem;

  OrderItemWidget(this.orderItem);

  @override
  _OrderItemWidgetState createState() => _OrderItemWidgetState();
}

class _OrderItemWidgetState extends State<OrderItemWidget> {
  bool expanded = false;

  @override
  Widget build(BuildContext context) {
    return Card(
        margin: EdgeInsets.all(10),
        child: Column(children: <Widget>[
          ListTile(
              title: Text('${widget.orderItem.amount}'),
              subtitle: Text(
                  DateFormat('dd/MM/yyyy hh:mm')
                      .format(widget.orderItem.dateTime),
                  style: TextStyle(color: Colors.black)),
              trailing: IconButton(
                  icon: expanded
                      ? Icon(Icons.expand_less)
                      : Icon(Icons.expand_more),
                  onPressed: () {
                    setState(() {
                      expanded = !expanded;
                    });
                  })),
          if (expanded)
            Container(
              padding: EdgeInsets.symmetric(vertical:10, horizontal: 20),
              height: widget.orderItem.cartItemList.length * 20.0 + 50,
              child: ListView.builder(
                  itemBuilder: (context, index) {
                    CartItem cartItem = widget.orderItem.cartItemList[index];
                    return Container(
                      margin: EdgeInsets.symmetric(vertical:5),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text('${cartItem.quantity.toString()}   ${cartItem.title}', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
                            Spacer(),
                            Text('\$${cartItem.price}')
                          ]),
                    );
                  },
                  itemCount: widget.orderItem.cartItemList.length),
            )

        ]));
  }
}
