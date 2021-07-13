import 'package:flutter/material.dart';
import 'package:projects/MealsApp/models/meal.dart';
import 'package:projects/MealsApp/widgets/meals/meal_detail_screen.dart';

import '../meals/meals_screen.dart';
import 'meal_detail_screen.dart';

class MealItem extends StatelessWidget {
  late Meal meal;

  MealItem(this.meal);

  void opTapMealItem(BuildContext context) {
    Navigator.of(context)
        .pushNamed(MealDetailScreen.ROUTES_NAME, arguments: meal)
        .then((result) {
      if (result is Meal) {
        print((result as Meal).title);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () => opTapMealItem(context),
        child: Card(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            elevation: 4,
            margin: EdgeInsets.all(5),
            child: new Column(children: [
              Stack(
                children: <Widget>[
                  new ClipRRect(
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(15),
                          topLeft: Radius.circular(15)),
                      child: Image.network(meal.imageUrl!,
                          height: 250,
                          width: double.infinity,
                          fit: BoxFit.cover)),
                  new Positioned(
                      bottom: 5,
                      left: 5,
                      child: ClipRRect(
                          borderRadius:
                              BorderRadius.only(topRight: Radius.circular(15)),
                          child: Container(
                            padding: EdgeInsets.all(5),
                            color: Colors.white,
                            width: 300,
                            child: Container(
                              padding: EdgeInsets.all(5),
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: <Widget>[
                                    Text(meal.title!),
                                    Row(children: [
                                      Text(
                                          meal.isVegan == true
                                              ? ''
                                              : 'Vegan   ',
                                          style: TextStyle(
                                              color: Colors.lightGreen)),
                                      Text(meal.isSugarFree == true
                                          ? ''
                                          : 'Sugar Free ')
                                    ]),
                                  ]),
                            ),
                          ))),
                ],
              ),
            ])));
  }
}
