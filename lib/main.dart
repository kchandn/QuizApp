import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/quiz.dart';
import './result.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // @override
  // _MyAppState createState() => _MyAppState();
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  var _questionIndex = 0;
  var _totalScore = 0;

  void _answerQuestion(int score) {
    _totalScore += score;
    setState(() {
      _questionIndex = _questionIndex + 1;
    });
    print(_questionIndex);
  }

  void _resetQuiz(){
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  var _questions = [
    {
      'questionText': 'What\'s your favourite color?',
      'answers': [
        {'text': 'Blue', 'score': 10},
        {'text': 'Black', 'score': 5},
        {'text': 'Red', 'score': 3},
        {'text': 'Green', 'score': 1},
      ],
    },
    {
      'questionText': 'What\'s your favourite Sports?',
      'answers': [
        {'text': 'Cricket', 'score': 11},
        {'text': 'Football', 'score': 7},
        {'text': 'Kabbadi', 'score': 9},
        {'text': 'Ludo', 'score': 1},
      ],
    },
    {
      'questionText': 'What\'s your favourite Tutor?',
      'answers': [
        {'text': 'Saurabh', 'score': 10},
        {'text': 'Saurabh Mishra', 'score': 50},
        {'text': 'Mishra', 'score': 6},
      ],
    },
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("My First App"),
        ),
        body: _questionIndex < _questions.length
            ? Quiz(
                questions: _questions,
                questionIndex: _questionIndex,
                answerQuestion: _answerQuestion)
            : Result(_totalScore, _resetQuiz),
      ),
    );
  }
}
