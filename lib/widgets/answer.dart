import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Answer extends StatelessWidget {
  final answer, questionNumber;
  final Function _checkAnswer;
  Answer(this.answer, this.questionNumber, this._checkAnswer);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      child: RaisedButton(
        child: Text(
          answer,
          style: GoogleFonts.lato(
            textStyle: TextStyle(color: Colors.white70, fontSize: 25),
          ),
        ),
        color: Colors.black45,
        onPressed: () {
          _checkAnswer(questionNumber, answer);
        },
      ),
    );
  }
}
