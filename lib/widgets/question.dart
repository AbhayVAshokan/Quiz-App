import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Question extends StatelessWidget {
  final question, questionNumber;
  Question(this.question, this.questionNumber);

  @override
  Widget build(BuildContext context) {
    return Text(
      question[questionNumber]['questionText'],
      textAlign: TextAlign.center,
      style: GoogleFonts.lato(
        textStyle: TextStyle(
          fontSize: 30,
          color: Colors.white70,
        ),
      ),
    );
  }
}
