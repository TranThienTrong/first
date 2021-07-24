import 'package:flutter/material.dart';
import 'package:projects/ShopApp/models/product.dart';
import 'package:projects/ShopApp/providers/cart.dart';
import 'package:projects/ShopApp/providers/product_provider.dart';
import 'package:provider/provider.dart';

class ProductItem extends StatelessWidget {
  late Product product;

  ProductItem();

  @override
  Widget build(BuildContext context) {
    Product product = Provider.of<Product>(context);
    Cart cart = Provider.of<Cart>(context);

    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: GridTile(
          child: GestureDetector(
              onTap: () => {
                    Navigator.of(context).pushNamed('product_detail_screen',
                        arguments: product.id)
                  },
              child: Image.network(product.imageUrl!, fit: BoxFit.cover)),
          footer: GridTileBar(
              leading: IconButton(
                  icon: product.isFavourite
                      ? Icon(Icons.favorite, color: Colors.red)
                      : Icon(Icons.favorite_border),
                  onPressed: () {
                    product.toggleFavourite();
                  }),
              backgroundColor: Colors.black54,
              title: Text(product.title!, textAlign: TextAlign.center),
              trailing: IconButton(
                  icon: cart.cartItemList.keys.contains(product.id)
                      ? Icon(Icons.shopping_cart, color: Colors.amber)
                      : Icon(Icons.shopping_cart_outlined, color: Colors.white),
                  onPressed: () {
                    cart.addCartItem(product.id!);

                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text('Add to cart'),
                      duration: Duration(seconds: 1),
                      action: SnackBarAction(
                        label: 'Undo',
                        onPressed: () {
                          cart.removeCartItem(product.id!);
                        },
                      ),
                    ));
                  }))),
    );
  }
}
