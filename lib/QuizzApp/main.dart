import 'package:flutter/material.dart';
import 'package:projects/QuizzApp/quizz.dart';
import 'package:projects/QuizzApp/result.dart';
import './answer.dart';

class MyApp extends StatefulWidget {
  static int totalScore = -1;
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  int _currQuestion = 0;

  void getAnswer() {
    setState(() {
      print(MyApp.totalScore);
      _currQuestion++;
    });
  }

  List<Widget> getAnswerWidgetOfEachQuestion(int index) {
    List<Widget> list = [];
    var it = (_questionsList[index]['answer'] as List<String>).iterator;


    while (it.moveNext()) {
      list.add(Answer(getAnswer, it.current.toString(),_questionsList[index]['right'].toString()));
    }

    return list;
  }


  List<Map<String, Object>> _questionsList = [
    {
      'question': 'What\'s your favourite color',
      'answer': ['Red', 'Blue', 'Green'],
      'right': 'Blue'
    },
    {
      'question': 'What\'s your fav animal',
      'answer': ['Cat', 'Dog'],
      'right': 'Cat'
    },
    {
      'question': 'What\'s the name of most handsome',
      'answer': ['Thien Trong', 'Van Trong', 'Thi Trong'],
      'right': 'Thien Trong'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("My First App"),
        ),
        body: _currQuestion < _questionsList.length
            ? Quizz(questionsList: _questionsList,
                    getAnswerWidgetOfEachQuestion: getAnswerWidgetOfEachQuestion,
                    currQuestion: _currQuestion)
            : Result(),

      ),
    );
  }
}

void main() => runApp(MyApp());
