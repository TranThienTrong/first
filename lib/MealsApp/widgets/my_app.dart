import 'package:flutter/material.dart';
import 'package:projects/MealsApp/models/meal.dart';
import 'package:projects/MealsApp/widgets/Categories/categories_screen.dart';
import 'package:projects/MealsApp/widgets/filter_screen.dart';
import 'package:projects/MealsApp/widgets/meals/meal_detail_screen.dart';
import 'package:projects/MealsApp/widgets/tabs.dart';
import 'package:projects/MealsApp/data/data.dart';

import 'favourite_screen.dart';
import 'meals/meals_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> currentFilter = {'isVegan': false, 'isSugarFree': false};
  List<Meal> availableMeal = Data.MEALS;

  void setFilter(Map<String, bool> filter) {
    setState(() {
      this.currentFilter = filter;

      availableMeal = Data.MEALS.where((meals) {
        if (filter['isVegan'] == true) {
          if (meals.isVegan == true) {
            return false;
          }
        }
        if (filter['isSugarFree'] == true) {
          if (meals.isSugarFree == true) {
            return false;
          }
        }

        return true;
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
        title: 'Homepage',
        theme: ThemeData(
            primarySwatch: Colors.deepOrange,
            fontFamily: 'OpenSans',
            textTheme: ThemeData.light().textTheme.copyWith(
                caption: TextStyle(color: Colors.white),
                button: TextStyle(color: Colors.white))),
        home: _MyHomePage(),
        initialRoute: 'tabs_screen',
        routes: {
          'tabs_screen': (context) => Tabs(),
          'meals_screen': (context) => MealsScreen(availableMeal),
          FilterScreen.ROUTES_NAME: (context) => FilterScreen(currentFilter,setFilter),
          MealDetailScreen.ROUTES_NAME: (context) => MealDetailScreen(),
          'favorite_screen': (context) => FavoriteScreen()
        },
        onUnknownRoute: (settings) {
          return MaterialPageRoute(builder: (context) => CategoriesScreen());
        });
  }
}

class _MyHomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyHomePageState();
  }
}

class _MyHomePageState extends State<_MyHomePage> {
  AppBar appBar = new AppBar(title: Text('Meals App'));

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: appBar, body: CategoriesScreen());
  }
}
