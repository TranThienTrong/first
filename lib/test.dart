import 'package:flutter/material.dart';

class Test extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(title: new Text('Test App')),
        body: new Row(children: <Widget>[
          Expanded(
              flex: 1,
              child:
                  Container(height: 100, color: Colors.red, child: Text('1'))),
          Expanded(
              flex: 2,
              child:
                  Container(height: 100, color: Colors.blue, child: Text('2'))),
          Expanded(
              flex: 1,
              child: Container(
                  height: 100, color: Colors.yellow, child: Text('3')))
        ]));
  }
}

void main() {
  runApp(MaterialApp(home: Test()));
}
