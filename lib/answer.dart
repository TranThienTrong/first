import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
  late final void Function() selected;
  late final String answerText;

  Answer(this.selected, this.answerText){}


  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.only(left: 15, right: 15),
      child: Row(
        children: <Widget>[
          ElevatedButton(
              onPressed: selected,
              child: Text(answerText),
              style: ElevatedButton.styleFrom(primary: Colors.deepOrange)
          ),
        ],
      ),
    );
  }
}
