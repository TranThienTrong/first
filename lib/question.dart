import 'package:flutter/material.dart';

class Question extends StatelessWidget {
  late String question;

  var questionsList = <String>[
    'What\'s your fav color',
    'What\'s your fav animal',
    'What\'s your fav food',
  ];


  List<String> getQuestionList(){
    return questionsList;
  }

  Question(String question) {
    this.question = question;
  }

  @override
  Widget build(BuildContext context) {

    return Container(
        width: double.infinity,
        margin: EdgeInsets.only(left: 10, top: 10),
        child: Text(
          question,
          style: TextStyle(fontSize: 28),
          textAlign: TextAlign.center,
        ),
    );

  }
}
