import 'package:flutter/cupertino.dart';
import 'package:projects/ShopApp/models/product.dart';
import 'package:projects/ShopApp/providers/product_provider.dart';
import 'package:provider/provider.dart';

/* Lớp này tạo ra chủ yếu để cộng tổng các product giống nhau cho dễ */
class CartItem {
  final String id;
  final String title;
  final double price;
  int quantity;

  CartItem(
      {required this.id,
      required this.title,
      required this.price,
      this.quantity = 1});
}

class Cart with ChangeNotifier {
  ProductProvider productProvider;

  Cart(this.productProvider);

  late Map<String, CartItem> _cartItemList = {};

  Map<String, CartItem> get cartItemList => this._cartItemList;

  int get cartItemQuantity => this._cartItemList.length;

  void addCartItem(String productId) {
    if (_cartItemList.containsKey(productId)) {
      _cartItemList.update(
          productId,
          (existCartItem) => CartItem(
              id: existCartItem.id,
              title: existCartItem.title,
              price: existCartItem.price,
              quantity: existCartItem.quantity += 1));
    } else {
      Product? product = productProvider.findProduct(productId);
      _cartItemList.putIfAbsent(
          productId,
          () => CartItem(
              id: DateTime.now().toString(),
              title: product!.title!,
              price: product.price!,
              quantity: 1));
    }
    notifyListeners();
  }

  void removeCartItem(String productId) {
    if (_cartItemList.containsKey(productId)) {
      if (cartItemList[productId]!.quantity > 1) {
        cartItemList.update(
            productId,
            (existCartItem) => CartItem(
                id: existCartItem.id,
                title: existCartItem.title,
                price: existCartItem.price,
                quantity: existCartItem.quantity -= 1));
      } else if (cartItemList[productId]!.quantity == 1) {
        _cartItemList.remove(productId);
      }

      notifyListeners();
    }
  }

  double get totalPrice {
    double sum = 0;
    this._cartItemList.forEach((productId, cartItem) {
      sum += cartItem.price * cartItem.quantity;
    });
    return sum;
  }

  void clear() {
    _cartItemList.clear();
    notifyListeners();
  }
}
