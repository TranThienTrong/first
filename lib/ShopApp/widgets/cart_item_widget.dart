import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:projects/ShopApp/models/product.dart';
import 'package:projects/ShopApp/providers/cart.dart';
import 'package:projects/ShopApp/providers/product_provider.dart';
import 'package:provider/provider.dart';

class CartItemWidget extends StatelessWidget {
  CartItem? cartItem;
  String? productId;

  CartItemWidget(this.productId, this.cartItem);

  @override
  Widget build(BuildContext context) {
    Cart cart = Provider.of<Cart>(context);
    Product? product =
        Provider.of<ProductProvider>(context).findProduct(productId!);
    return Dismissible(
      key: ValueKey(productId),
      background: Container(
        color: Theme.of(context).errorColor,
        alignment: Alignment.centerRight,
        child: Icon(Icons.delete, color: Colors.white, size: 40),
      ),
      direction: DismissDirection.endToStart,
      onDismissed: (direction) {
        cart.removeCartItem(productId!);
      },
      confirmDismiss: (direction) {
        return showDialog(
            context: context,
            builder: (context) =>
                AlertDialog(content: Text('Delete this product?'), actions: [
                  ElevatedButton(
                      child: Text('Yes'),
                      onPressed: () {
                        Navigator.of(context).pop(true);
                      }),
                  ElevatedButton(
                      child: Text('Cancel'),
                      onPressed: () {
                        Navigator.of(context).pop(false);
                      })
                ]));
      },
      child: Card(
          margin: EdgeInsets.all(5),
          child: Container(
              padding: EdgeInsets.all(10),
              child: ListTile(
                  leading: FittedBox(
                      fit: BoxFit.cover,
                      child: CircleAvatar(
                          backgroundColor: Colors.white,
                          child: Image.network(product!.imageUrl!))),
                  title: Text(cartItem!.title,
                      style: TextStyle(color: Colors.black)),
                  subtitle: Text(
                      (cartItem!.price * cartItem!.quantity).toString(),
                      style: TextStyle(color: Colors.black)),
                  trailing: Text(cartItem!.quantity.toString(),
                      style: TextStyle(color: Colors.black))))),
    );
  }
}
