import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:projects/ShopApp/data/product.dart';
import 'package:projects/ShopApp/providers/product_provider.dart';
import 'package:projects/ShopApp/widgets/product_item.dart';
import 'package:provider/provider.dart';

class ProductOverviewScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {


    ProductProvider productProvider = Provider.of<ProductProvider>(context);
    List<Product> productList = productProvider.productList;

    return Scaffold(
        appBar: AppBar(title: Text('Shop App')),
        body: Container(
            child: GridView.count(
          crossAxisCount: 2,
          padding: EdgeInsets.all(19),
          childAspectRatio: 1,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
          children: productList.map((product) => ProductItem(product)).toList(),
        )),
      );
  }

}

