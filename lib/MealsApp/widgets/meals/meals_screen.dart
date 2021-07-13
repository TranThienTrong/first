import 'package:flutter/material.dart';
import 'package:projects/MealsApp/data/data.dart';
import 'package:projects/MealsApp/models/meal.dart';

import 'meal_item.dart';

class MealsScreen extends StatelessWidget {
  late List<Meal> mealsList;

  MealsScreen(this.mealsList);


  @override
  Widget build(BuildContext context) {
    Map<String, Object> argumentsFromRoute =
        ModalRoute.of(context)!.settings.arguments as Map<String, Object>;

    String categoryTitle = argumentsFromRoute['title'].toString();
    String categoryIdFromRoute = argumentsFromRoute['id'].toString();

    List<Meal> mealsOfThisCategory = [];

    for (Meal currentMeal in mealsList) {
      if (currentMeal.categoriesId.contains(categoryIdFromRoute)) {
        mealsOfThisCategory.add(currentMeal);
      }
    }

    return Scaffold(
        appBar: AppBar(title: Text(categoryTitle)),
        body: Container(
            child: ListView.builder(
          itemBuilder: (context, index) {
            return MealItem(mealsOfThisCategory[index]);
          },
          itemCount: mealsOfThisCategory.length,
        )));
  }
}
