import 'package:flutter/material.dart';
import 'package:projects/quizz.dart';
import './question.dart';
import './answer.dart';

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  int _currQuestion = 0;

  void getAnswer() {
    setState(() {
      _currQuestion++;
    });
  }

  List<Widget> getAnswerWidgetOfEachQuestion(int index) {
    List<Widget> list = [];
    var it = (_questionsList[_currQuestion]['answer'] as List<String>).iterator;

    while (it.moveNext()) {
      list.add(Answer(getAnswer, it.current.toString()));
    }

    print(list);
    return list;
  }

  var _questionsList = [
    {
      'question': 'What\'s your favourite color',
      'answer': ['Red', 'Blue', 'Green']
    },
    {
      'question': 'What\'s your fav animal',
      'answer': ['Cat', 'Dog']
    },
    {
      'question': 'What\'s the name of most handsome',
      'answer': ['Trong', 'Trong', 'Trong']
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
            : ,

      ),
    );
  }
}

void main() => runApp(MyApp());
