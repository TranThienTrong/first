import 'package:flutter/foundation.dart';

class Transaction{
  late String id;
  late String title;
  late double price;
  DateTime? dateTime = DateTime.now();




  Transaction({ required String this.id, required String this.title, required double this.price, required DateTime? this.dateTime});

  @override
  String toString() {
    return super.toString();
  }
}