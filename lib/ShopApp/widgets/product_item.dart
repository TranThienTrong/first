import 'package:flutter/material.dart';
import 'package:projects/ShopApp/data/product.dart';
import 'package:projects/ShopApp/providers/product_provider.dart';
import 'package:provider/provider.dart';

class ProductItem extends StatelessWidget {
  late Product product;

  ProductItem(this.product);

  void moveToProductDetailScreen(BuildContext context) {
    Navigator.of(context).pushNamed('product_detail_screen',arguments: this.product);
  }

  @override
  Widget build(BuildContext context) {


    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: GridTile(
          child: GestureDetector(
              onTap: () => moveToProductDetailScreen(context),
              child: Image.network(product.imageUrl, fit: BoxFit.cover)),
          footer: GridTileBar(
              leading: IconButton(icon: Icon(Icons.favorite), onPressed: () {}),
              backgroundColor: Colors.black54,
              title: Text(product.title, textAlign: TextAlign.center),
              trailing: IconButton(
                  icon: Icon(Icons.shopping_cart), onPressed: () {}))),
    );
  }
}
