import 'package:flutter/material.dart';

import '../meals/meals_screen.dart';

class CategoryItem extends StatelessWidget {
  late String id;
  late String title;
  Color? color;

  CategoryItem(this.id, this.title, this.color);

  void onTapCategory(BuildContext context) {
    Navigator.of(context).pushNamed('meals_screen', arguments: {'id': this.id, 'title': this.title});
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTapCategory(context),
      child: Container(
          alignment: Alignment.center,
          padding: EdgeInsets.all(15),
          decoration: BoxDecoration(
              color: this.color, borderRadius: BorderRadius.circular(20)),
          child: Text('${this.title}',
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 20),
              textAlign: TextAlign.center)),
    );
  }
}
