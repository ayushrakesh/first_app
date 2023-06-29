import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int totalscore;
  final Function() resetQuiz;

  Result(this.totalscore, this.resetQuiz);

  String get resultPhrase {
    var resultText;
    if (totalscore <= 8) {
      resultText = 'You are awesome and innocent!';
    } else if (totalscore <= 14) {
      resultText = 'You are likeable..';
    } else if (totalscore <= 20) {
      resultText = 'You are strange!';
    } else {
      resultText = 'You are bad😶';
    }
    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.all(20),
        ),
        Center(
          child: Text(
            resultPhrase,
            style: TextStyle(
              fontSize: 36,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        FlatButton(
          onPressed: resetQuiz,
          child: Text('Reset Quiz'),
          color: Colors.blue.shade600,
        ),
      ],
    );
  }
}
