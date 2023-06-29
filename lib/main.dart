import './quiz.dart';
import 'package:flutter/material.dart';
import './result.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var _questions = [
    {
      'questionText': "What's your favourite color?",
      'answers': [
        {
          'text': 'White',
          'score': 10,
        },
        {
          'text': 'Red',
          'score': 8,
        },
        {
          'text': 'Green',
          'score': 6,
        },
        {
          'text': 'Black',
          'score': 4,
        },
      ],
    },
    {
      'questionText': "What's your favourite animal?",
      'answers': [
        {
          'text': 'Giraffe',
          'score': 10,
        },
        {
          'text': 'Horse',
          'score': 8,
        },
        {
          'text': 'Cow',
          'score': 6,
        },
        {
          'text': 'Dog',
          'score': 4,
        },
      ],
    },
    {
      'questionText': "What's your hobby?",
      'answers': [
        {
          'text': 'Dance',
          'score': 10,
        },
        {
          'text': 'Sing',
          'score': 8,
        },
        {
          'text': 'Read',
          'score': 6,
        },
        {
          'text': 'Bicycle',
          'score': 4,
        },
      ],
    },
    {
      'questionText': "What's your favourite instructor?",
      'answers': [
        {
          'text': 'Maxmilian',
          'score': 10,
        },
        {
          'text': 'Jonas',
          'score': 8,
        },
        {
          'text': 'Harry',
          'score': 6,
        },
        {
          'text': 'Angela-Yu',
          'score': 4,
        },
      ]
    },
  ];

  var _questionIndex = 0;
  var _totalScore = 0;

  void _answerQuestion(int score) {
    _totalScore = _totalScore + score;

    setState(() {
      _questionIndex++;
    });
  }

  void resetQuiz() {
    setState(() {
      _totalScore = 0;
      _questionIndex = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("AppBar Heading"),
        ),
        body: Container(
          margin: EdgeInsets.only(
            left: 14,
            right: 14,
            top: 32,
          ),
          child: (_questionIndex < _questions.length)
              ? Quiz(_questions, _questionIndex, _answerQuestion)
              : Result(_totalScore, resetQuiz),
        ),
      ),
    );
  }
}
