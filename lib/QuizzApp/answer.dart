import 'package:flutter/material.dart';
import 'main.dart';

class Answer extends StatelessWidget {
  late final void Function() selected;
  late final String answerText;
  final String right;

  Answer(this.selected, this.answerText, this.right){

    if(this.answerText.compareTo(this.right)==0){
       MyApp.totalScore++;
    }
  }

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
