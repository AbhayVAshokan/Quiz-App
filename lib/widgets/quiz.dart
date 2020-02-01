import 'package:flutter/material.dart';

import './score.dart';
import './question.dart';
import './answer.dart';

class Quiz extends StatelessWidget {
  final score, question, questionNumber, checkAnswer, questionCounter;
  Quiz({this.score, this.question, this.questionNumber, this.checkAnswer, this.questionCounter});

  @override
  Widget build(BuildContext context) {
    return Column(
            children: <Widget>[
              Score(score, questionCounter),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  SizedBox(height: 100),
                  Question(question, questionNumber),
                  SizedBox(
                    height: 50,
                  ),
                  ...(question[questionNumber]['answerText'] as List<String>)
                      .map((answer) {
                    return Answer(answer, questionNumber, checkAnswer);
                  }).toList(),
                ],
              ),
            ],
          );
  }
}