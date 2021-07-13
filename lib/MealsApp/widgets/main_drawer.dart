import 'package:flutter/material.dart';

class MainDrawer extends StatelessWidget {
  Widget buildListTile(String title, Icon icon, Function() onTap) {
    return new ListTile(
      leading: icon,
      title: Text(
        title.toString(),
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
      ),
      onTap: onTap,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: Column(children: <Widget>[
      new Container(
          alignment: Alignment.centerLeft,
          height: 100,
          width: double.infinity,
          color: Colors.blue,
          padding: EdgeInsets.all(10),
          child: Text('Cooking up',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Colors.white))),
      new SizedBox(height: 20),
      buildListTile('Meals', Icon(Icons.restaurant),
          () => Navigator.of(context).pushReplacementNamed('tabs_screen')),
      buildListTile('Meals Filter', Icon(Icons.filter),
          () => Navigator.of(context).pushReplacementNamed('filter_screen'))
    ]));
  }
}
