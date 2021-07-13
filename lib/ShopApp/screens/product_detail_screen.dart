import 'package:flutter/material.dart';
import 'package:projects/MealsApp/models/meal.dart';
import 'package:projects/ShopApp/data/product.dart';
import 'package:projects/ShopApp/providers/product_provider.dart';
import 'package:provider/provider.dart';

class ProductDetailScreen extends StatelessWidget {
  late final Product product;

  ProductDetailScreen();

  @override
  Widget build(BuildContext context) {
    ProductProvider productProvider = Provider.of<ProductProvider>(context);

    this.product = ModalRoute.of(context)!.settings.arguments as Product;

    return Scaffold(
      appBar: AppBar(title: Text(product.title)),
      body: Column(children: <Widget>[
        new Container(
            height: 300,
            width: double.infinity,
            child: Image.network(product.imageUrl, fit: BoxFit.cover)),
        new Container(
            margin: EdgeInsets.all(10),
            child: Text('Ingredients', style: TextStyle(color: Colors.black))),
        // new Container(
        //     height: 300,
        //     width: 300,
        //     child: ListView.builder(
        //         itemBuilder: (context, index) {
        //           return Card(
        //               child: Padding(
        //                   padding: EdgeInsets.all(10),
        //                   child: Text('')));
        //         },
        //         itemCount: meal.ingredients!.length))
      ]),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.home),
          onPressed: () => Navigator.of(context).pop()
      ),
    );
  }
}
