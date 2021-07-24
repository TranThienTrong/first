import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:projects/ShopApp/providers/auth.dart';
import 'package:provider/provider.dart';

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          AppBar(title: Text('Hello world'), automaticallyImplyLeading: false),
          Divider(),
          ListTile(
            leading: Icon(Icons.home),
            title: Text('Home'),
            onTap: () {
              Navigator.of(context).pushReplacementNamed('main_screen');
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.report),
            title: Text('My Order'),
            onTap: () {
              Navigator.of(context).pushNamed('order_screen');
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.edit),
            title: Text('My Product'),
            onTap: () {
              Navigator.of(context).pushNamed('user_product_screen');
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.add),
            title: Text('Add Product'),
            onTap: () {
              Navigator.of(context).pushNamed('add_user_product_screen');
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.exit_to_app),
            title: Text('Add Product'),
            onTap: () {
             Provider.of<Auth>(context, listen: false).logout();
             Navigator.of(context).pop();
            },
          )

        ],
      ),
    );
  }
}
