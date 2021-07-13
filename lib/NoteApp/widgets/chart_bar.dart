import 'package:flutter/material.dart';

class CharBar extends StatelessWidget {
  final String label;
  final double spendingAmount;
  final double spendingPercentage;

  CharBar(this.label, this.spendingAmount, this.spendingPercentage);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraint) {
      return Column(children: <Widget>[
        FittedBox(child: Text('\$${spendingAmount.toStringAsFixed(2)}')),
        Container(
            margin: EdgeInsets.symmetric(vertical: 5),
            height: constraint.maxHeight * 0.7,
            width: 20,
            child: Stack(children: <Widget>[
              new FractionallySizedBox(
                heightFactor: spendingPercentage,
                child: Container(
                    decoration: BoxDecoration(
                        color: Colors.amber,
                        borderRadius: BorderRadius.circular(3))),
              ),
              new Container(
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.blue, width: 1),
                    borderRadius: BorderRadius.circular(3)),
              ),
            ])),
        Text(label)
      ]);
    });
  }
}
