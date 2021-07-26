import 'package:flutter/material.dart';
import 'package:projects/GreatPlaceApp/providers/place_provider.dart';
import 'package:projects/GreatPlaceApp/screens/add_place_screen.dart';
import 'package:projects/GreatPlaceApp/screens/places_list_screen.dart';
import 'package:provider/provider.dart';

import 'database/db_helper.dart';

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    //DBHelper.dropDatabase();
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => PlaceProvider()),
      ],
      child: Consumer<PlaceProvider>(
        builder: (context, auth, _) =>
            MaterialApp(
                title: 'Places',
                theme: ThemeData(
                    primarySwatch: Colors.indigo,
                    accentColor: Colors.amber,
                    fontFamily: 'Lato',
                    textTheme: ThemeData
                        .light()
                        .textTheme
                        .copyWith(
                        caption: TextStyle(color: Colors.white),
                        button: TextStyle(color: Colors.white))),
                home: PlacesListScreen(),
                routes: setRouteTable(context)
            ),
      ),);
  }
}

Map<String, Widget Function(BuildContext)> setRouteTable(BuildContext context) {
  return {
    'main_screen': (context) => MyApp(),
    'places_list_screen': (context) => PlacesListScreen(),
    'add_place_screen': (context) => AddPlaceScreen(),
  };
}

void main(List<String> args) {
  runApp(MyApp());
}
