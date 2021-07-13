import 'package:flutter/material.dart';
import 'package:projects/MealsApp/models/meal.dart';

class MealDetailScreen extends StatelessWidget {
  static const String ROUTES_NAME = 'meals_detail_screen';

  @override
  Widget build(BuildContext context) {
    Meal meal = (ModalRoute.of(context)!.settings.arguments) as Meal;
    return Scaffold(
      appBar: AppBar(title: Text(meal.title!)),
      body: Column(children: <Widget>[
        new Container(
            height: 300,
            width: double.infinity,
            child: Image.network(meal.imageUrl!, fit: BoxFit.cover)),
        new Container(
            margin: EdgeInsets.all(10),
            child: Text('Ingredients', style: TextStyle(color: Colors.black))),
        new Container(
            height: 300,
            width: 300,
            child: ListView.builder(
                itemBuilder: (context, index) {
                  return Card(
                      child: Padding(
                          padding: EdgeInsets.all(10),
                          child: Text(meal.ingredients![index].toString())));
                },
                itemCount: meal.ingredients!.length))
      ]),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.home),
        onPressed: () => Navigator.of(context).pop(meal)
      ),
    );
  }
}
