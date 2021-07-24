import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:projects/ShopApp/models/constant.dart';
import 'package:projects/ShopApp/models/product.dart';
import 'package:projects/ShopApp/providers/auth.dart';
import 'package:projects/ShopApp/screens/product_overview_screen.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ProductProvider with ChangeNotifier {
  String accessToken = Auth.token!;

  ProductProvider();
  static List<Product> _userProductList = [];

  static List<Product> _productList = [
    Product(
      id: 'p1',
      title: 'Red Shirt',
      desc: 'A red shirt - it is pretty red!',
      price: 29.99,
      imageUrl:
          'https://cdn.pixabay.com/photo/2016/10/02/22/17/red-t-shirt-1710578_1280.jpg',
    ),
    Product(
      id: 'p2',
      title: 'Trousers',
      desc: 'A nice pair of trousers.',
      price: 59.99,
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/e/e8/Trousers%2C_dress_%28AM_1960.022-8%29.jpg/512px-Trousers%2C_dress_%28AM_1960.022-8%29.jpg',
    ),
    Product(
      id: 'p3',
      title: 'Yellow Scarf',
      desc: 'Warm and cozy - exactly what you need for the winter.',
      price: 19.99,
      imageUrl:
          'https://live.staticflickr.com/4043/4438260868_cc79b3369d_z.jpg',
    ),
    Product(
      id: 'p4',
      title: 'A Pan',
      desc: 'Prepare any meal you want.',
      price: 49.99,
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/1/14/Cast-Iron-Pan.jpg/1024px-Cast-Iron-Pan.jpg',
    )
  ];

  List<Product> get productList {
    return _productList;
  }

  Product? findProduct(String id) {
    for (Product product in _productList) {
      if (product.id == id) {
        return product;
      }
    }
    return null;
  }

  Future<void> getAllProductFromDB() async {
    Uri url = Uri.parse(
        'https://flutter-first-64413-default-rtdb.asia-southeast1.firebasedatabase.app/product.json?auth=${Auth.token}');

    print(Auth.token);
    List<Product> productList = [];
    try {
      final response = await http.get(url);
      Map resource = json.decode(response.body);
      resource.forEach((key, value) {
        Product product = Product(
            id: key,
            title: value['title'],
            desc: value['desc'],
            price: value['price'],
            imageUrl: value['imageUrl']);
        productList.add(product);
      });
      _productList = productList;
      notifyListeners();
    } on Error catch (e) {
      throw e;
    }
  }

  static List<Product> get userProductList => _userProductList;

  Future<void> getUserProductFromDB() async {
    Uri url = Uri.parse(
        'https://flutter-first-64413-default-rtdb.asia-southeast1.firebasedatabase.app/product.json?auth=${Auth.token}&orderBy="userId"&equalTo="${Auth.userId}"');
    print(Auth.userId);
    try {
      final response = await http.get(url);
      Map resource = json.decode(response.body);
      resource.forEach((key, value) {
        Product product = Product(
            id: key,
            title: value['title'],
            desc: value['desc'],
            price: value['price'],
            imageUrl: value['imageUrl']);
        _userProductList.add(product);
      });
      notifyListeners();
    } on Error catch (e) {
      throw e;
    }
  }



  Future<void> addProduct(Product newProduct) {
    Uri url = Uri.parse(
        'https://flutter-first-64413-default-rtdb.asia-southeast1.firebasedatabase.app/product.json?auth=${Auth.token}');

    return http
        .post(
      url,
      body: json.encode({
        'title': newProduct.title,
        'desc': newProduct.desc,
        'imageUrl': newProduct.imageUrl,
        'price': newProduct.price,
        'isFavourite': newProduct.isFavourite,
        'userId':Auth.userId
      }),
    )
        .catchError((error) {
      print(error);
      throw error;
    }).then((response) {
      if (response.statusCode == 200) {
        notifyListeners();
        _productList.add(newProduct);
        Map responseMess = json.decode(response.body);
        print(responseMess.toString() + 'added');
      }
    });
  }

  Future<void> deleteProduct(String id) async {
    Uri url = Uri(
        scheme: 'https',
        host:
            'flutter-first-64413-default-rtdb.asia-southeast1.firebasedatabase.app',
        path: 'product/123');

    Response response = await http.delete(url);
    try {
      if (response.statusCode >= 400) {
        throw HttpException('Oh no');
      }
    } catch (e) {
      print(e);
    }
  }

  Future<void> updateProduct(
      Product newProduct, String title, double price, String desc) async {
    Uri url = Uri.parse('https://flutter-first-64413-default-rtdb.asia-southeast1.firebasedatabase.app/product/${newProduct.id}.json?auth=${Auth.token}');


    newProduct.title != title
        ? newProduct.title = title
        : newProduct.title = newProduct.title;
    newProduct.price != price
        ? newProduct.price = price
        : newProduct.price = newProduct.price;
    newProduct.desc != desc
        ? newProduct.desc = desc
        : newProduct.desc = newProduct.desc;

    await http.patch(
      url,
      body: json.encode({
        'title': newProduct.title,
        'desc': newProduct.desc,
        'price': newProduct.price,
        'imageUrl': newProduct.imageUrl,
        'isFavourite': newProduct.isFavourite,
      }),
    );

    notifyListeners();
  }
}
