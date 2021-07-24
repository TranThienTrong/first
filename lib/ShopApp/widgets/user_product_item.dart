import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:projects/ShopApp/models/product.dart';
import 'package:projects/ShopApp/providers/product_provider.dart';
import 'package:provider/provider.dart';

class UserProductItem extends StatelessWidget {
  Product product;

  UserProductItem(this.product);

  @override
  Widget build(BuildContext context) {
    final ScaffoldMessengerState scaffold = ScaffoldMessenger.of(context);
    ProductProvider productProvider = Provider.of<ProductProvider>(context);
    return ListTile(
        title: Text(product.title!),
        leading: CircleAvatar(backgroundImage: NetworkImage(product.imageUrl!)),
        trailing: Container(
          width: 100,
          child: Row(
            children: [
              IconButton(
                  icon: Icon(Icons.edit),
                  color: Colors.amberAccent,
                  onPressed: () {
                    Navigator.of(context).pushNamed('edit_user_product_screen', arguments: product.id);
                  }),
              IconButton(
                icon: Icon(Icons.delete),
                color: Colors.red,
                onPressed: (){
                  try {
                    productProvider.deleteProduct(product.id!);
                  } on HttpException catch(e){
                        print(e);
                  }
                },
              )
            ],
          ),
        ));
  }
}
