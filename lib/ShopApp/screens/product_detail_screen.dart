import 'package:flutter/material.dart';
import 'package:projects/ShopApp/models/product.dart';
import 'package:projects/ShopApp/providers/product_provider.dart';
import 'package:projects/ShopApp/widgets/app_drawer.dart';
import 'package:provider/provider.dart';

class ProductDetailScreen extends StatelessWidget {
  ProductDetailScreen();

  @override
  Widget build(BuildContext context) {
    ProductProvider productProvider = Provider.of<ProductProvider>(context);

    Product loadedProduct = productProvider.productList.firstWhere((element) {
      return element.id ==
          (ModalRoute.of(context)!.settings.arguments as String);
    });

    return Scaffold(
      appBar: AppBar(title: Text(loadedProduct.title!)),
      drawer: AppDrawer(),
      body: Column(children: <Widget>[
        new Container(
            height: 300,
            width: double.infinity,
            child: Image.network(loadedProduct.imageUrl!, fit: BoxFit.cover)),
        new Container(
            margin: EdgeInsets.all(10),
            child: Text('Ingredients', style: TextStyle(color: Colors.black))),

      ]),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.home),
          onPressed: () => Navigator.of(context).pop()),
    );
  }
}
