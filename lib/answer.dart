import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
  final Function() answerQuestion;
  final String answer;

  Answer(this.answerQuestion, this.answer);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: OutlinedButton(
        onPressed: answerQuestion,
        child: Text(
          answer,
          style: TextStyle(
            color: Colors.blue.shade600,
            fontSize: 18,
            letterSpacing: 1.1,
          ),
        ),
      ),
    );
  }
}
