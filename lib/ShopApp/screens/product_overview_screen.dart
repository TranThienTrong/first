import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:projects/ShopApp/data/product.dart';
import 'package:projects/ShopApp/providers/cart.dart';
import 'package:projects/ShopApp/providers/product_provider.dart';
import 'package:projects/ShopApp/widgets/badge.dart';
import 'package:projects/ShopApp/widgets/product_item.dart';
import 'package:provider/provider.dart';

enum FilterProduct { Favorite, All }

class ProductOverviewScreen extends StatefulWidget {
  @override
  _ProductOverviewScreenState createState() => _ProductOverviewScreenState();
}

class _ProductOverviewScreenState extends State<ProductOverviewScreen> {
  late FilterProduct filter = FilterProduct.All;

  @override
  Widget build(BuildContext context) {
    ProductProvider productProvider = Provider.of<ProductProvider>(context);
    Cart cartProvider = Provider.of<Cart>(context);
    List<Product> productList = productProvider.productList;

    return Scaffold(
      appBar: AppBar(
        title: Text('Shop App'),
        actions: [
          Container(
            width: 50,
            child: PopupMenuButton(
                icon: Icon(Icons.more_vert),
                onSelected: (FilterProduct selectedItem) {
                  setState(() {
                    switch (selectedItem) {
                      case FilterProduct.Favorite:
                        filter = FilterProduct.Favorite;
                        break;
                      case FilterProduct.All:
                        filter = FilterProduct.All;
                        break;
                    }
                  });
                },
                itemBuilder: (_) =>
                [
                  PopupMenuItem(
                      child: Text('Favorite'), value: FilterProduct.Favorite),
                  PopupMenuItem(child: Text('All'), value: FilterProduct.All)
                ]),
          ),
          Container(
              width: 50,
              child: Consumer<Cart>(
                  builder: (_, cartProvider, iconButton) {
                    return Badge(
                        value: cartProvider.cartItemQuantity.toString(),
                        color: Colors.red,
                        child: iconButton!);
                  },
                  child: IconButton(
                      icon: Icon(Icons.shopping_cart), onPressed: () {
                    Navigator.of(context).pushNamed('cart_screen');
                  }))),
        ],
      ),
      body: Container(
          child: GridView.count(
            crossAxisCount: 2,
            padding: EdgeInsets.all(19),
            childAspectRatio: 1,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
            children: productList
                .where((element) {
              if (filter == FilterProduct.Favorite) {
                if (!element.isFavourite) {
                  return false;
                }
              }
              return true;
            })
                .map((product) =>
                ChangeNotifierProvider.value(
                    value: product, child: ProductItem()))
                .toList(),
          )),
    );
  }
}
