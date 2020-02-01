import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Score extends StatelessWidget {
  final score, questionCounter;
  Score(this.score, this.questionCounter);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Text(
          'Question ',
          style: GoogleFonts.lato(
            textStyle: TextStyle(color: Colors.white30, fontSize: 15),
          ),
        ),
        Text(
          questionCounter.toString(),
          style: GoogleFonts.lato(
            textStyle: TextStyle(
                color: Colors.white54,
                fontSize: 15,
                fontWeight: FontWeight.bold),
          ),
        ),
        Text(
          ' of ',
          style: GoogleFonts.lato(
            textStyle: TextStyle(color: Colors.white30, fontSize: 15),
          ),
        ),
        Text(
          '5',
          style: GoogleFonts.lato(
            textStyle: TextStyle(
                color: Colors.white54,
                fontSize: 15,
                fontWeight: FontWeight.bold),
          ),
        ),
        SizedBox(
          width: 170,
        ),
        Text(
          score.toString(),
          style: GoogleFonts.lato(
            textStyle: TextStyle(
              fontSize: 60,
              color: Colors.white30,
            ),
          ),
        ),
        
      ],
    );
  }
}
