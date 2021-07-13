import 'package:flutter/material.dart';
import 'package:projects/MealsApp/models/meal.dart';

import 'categories/categories_screen.dart';
import 'favourite_screen.dart';
import 'main_drawer.dart';

class Tabs extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _TabsState();
  }
}

class _TabsState extends State<Tabs> {

  List<Meal> favoriteMeal = <Meal>[];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
            appBar: AppBar(title: Text('Category')),
            drawer: MainDrawer(),
            body: Container( height:500, child: TabBarView(children: [CategoriesScreen(), FavoriteScreen()])),
            bottomSheet: Container(
              padding: EdgeInsets.all(0),
              color: Theme.of(context).primaryColor,
              child: TabBar(labelColor: Colors.white, tabs: <Widget>[
                Tab(icon: Icon(Icons.category), text: 'Category'),
                Tab(icon: Icon(Icons.star), text: 'Favorite'),
              ]),
            )));
  }
}
