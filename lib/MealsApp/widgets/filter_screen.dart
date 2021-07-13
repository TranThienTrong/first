import 'package:flutter/material.dart';
import 'package:projects/MealsApp/widgets/tabs.dart';

import 'categories/categories_screen.dart';
import 'main_drawer.dart';

class FilterScreen extends StatefulWidget {
  static const String ROUTES_NAME = 'filter_screen';

  late Function setFilter;
  late Map<String, bool> currentFilter;

  FilterScreen(this.currentFilter, this.setFilter);

  @override
  State<StatefulWidget> createState() {
    return _FilterScreenState();
  }
}

class _FilterScreenState extends State<FilterScreen> {
  bool isVegan = false;
  bool isSugarFree = false;

  @override
  initState(){
    isVegan = widget.currentFilter['isVegan']!;
    isSugarFree = widget.currentFilter['isSugarFree']!;
    super.initState();
  }

  Widget buildSwitchListTile(String title, String subTitle, bool currentValue,
      Function(bool) changeValue) {
    return SwitchListTile(
        title: Text('$title',
            style: TextStyle(color: Theme.of(context).primaryColor)),
        subtitle: Text('$subTitle', style: TextStyle(color: Colors.black)),
        value: currentValue,
        onChanged: changeValue);
  }

  @override
  Widget build(BuildContext context) {
    Map<String, bool> filter = {'isVegan': isVegan, 'isSugarFree': isSugarFree};


    return Scaffold(
        appBar: AppBar(
          title: Text('Filter'),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.save),
              onPressed: () {
                widget.setFilter(filter);
               Navigator.of(context).pushNamed('tabs_screen');
              },
            )
          ],
        ),
        drawer: MainDrawer(),
        body: Column(
          children: <Widget>[
            Container(
                padding: EdgeInsets.all(20),
                child: Text('Filter Preference',
                    style: TextStyle(color: Colors.black))),
            Expanded(
              child: ListView(children: <Widget>[
                buildSwitchListTile(
                    'Sugar Free', 'Not Include Sugar', isSugarFree, (newValue) {
                  setState(() => isSugarFree = newValue);
                }),
                buildSwitchListTile('Vegan', 'Not Include Meet', isVegan,
                    (newValue) {
                  setState(() => isVegan = newValue);
                })
              ]),
            )
          ],
        ));
  }
}
