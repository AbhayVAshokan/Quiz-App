import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class GameOver extends StatelessWidget {
  final score;
  GameOver(this.score);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Text(
            'GAME OVER',
            style: GoogleFonts.lato(
              textStyle: TextStyle(fontSize: 60, color: Colors.white60),
            ),
          ),
          Text(
            score.toString(),
            style: GoogleFonts.lato(
              textStyle: TextStyle(color: Colors.white, fontSize: 150),
            ),
          )
        ],
      ),
    );
  }
}
