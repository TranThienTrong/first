import 'package:flutter/material.dart';
import 'package:projects/MealsApp/models/categories.dart';
import 'package:projects/MealsApp/data/data.dart';

import 'category_item.dart';

class CategoriesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return

      GridView.count(
        childAspectRatio: 1.5,
        padding: EdgeInsets.all(10),
        crossAxisCount: 2,
        mainAxisSpacing: 20,
        crossAxisSpacing: 20,
        children: Data.CATEGORIES.map((category) {
          return CategoryItem(category.id, category.title, category.color);
        }).toList(),

    );
  }
}
