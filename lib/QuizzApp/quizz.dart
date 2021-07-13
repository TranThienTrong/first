import 'package:flutter/material.dart';
import 'package:projects/QuizzApp/question.dart';
import 'package:projects/QuizzApp/answer.dart';

class Quizz extends StatelessWidget {
  late int currQuestion;
  late final List<Map<String, Object>> questionsList;

  late final Function(int index) getAnswerWidgetOfEachQuestion;

  Quizz({required this.questionsList, required this.getAnswerWidgetOfEachQuestion, required this.currQuestion});


  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
    new Question(questionsList[currQuestion]['question'].toString()),
    ...getAnswerWidgetOfEachQuestion(currQuestion).toList()
    ]);
  }
}