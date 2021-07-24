import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class Product with ChangeNotifier {
  late String? _id;
  late String? _title;
  late String? _desc;
  late double? _price;
  late String? _imageUrl;
  bool isFavourite=false;


  Product({required id, required title, required desc, required price, required imageUrl, this.isFavourite = false}){
      this.id = id;
      this.title = title;
      this.desc = desc;
      this.price = price;
      this.imageUrl = imageUrl;
      this.isFavourite = isFavourite;
  }



  String? get id => _id;

  set id(String? value) {
    _id = value;
  }

  void toggleFavourite(){
    if(isFavourite){
      isFavourite = false;
    } else{
      isFavourite = true;
    }
    notifyListeners();
  }

  String? get title => _title;

  set title(String? value) {
    _title = value;
  }

  String? get imageUrl => _imageUrl;

  set imageUrl(String? value) {
    _imageUrl = value;
  }

  double? get price => _price;

  set price(double? value) {
    _price = value;
  }

  String? get desc => _desc;

  set desc(String? value) {
    _desc = value;
  }

}
