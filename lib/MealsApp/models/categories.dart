import 'package:flutter/material.dart';

class Category{

  late final String _id;
  late String _title;
  Color? _color;


  String get id => _id;


  Category({required String id ,required String title, Color? color=Colors.amberAccent}){
    this._id = id;
    this._title = title;
    this._color = color;
  }

  String get title => _title;

  set title(String value) {
    _title = value;
  }

  Color? get color => _color;

  set color(Color? value) {
    _color = value;
  }
}