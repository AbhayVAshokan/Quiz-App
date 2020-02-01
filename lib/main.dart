import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'dart:math';

import './widgets/quiz.dart';
import './widgets/gameover.dart';

void main() => runApp(QuizApp());

class QuizApp extends StatefulWidget {
  @override
  _QuizAppState createState() => _QuizAppState();
}

class _QuizAppState extends State<QuizApp> {

  var score = 0;
  var questionNumber;
  var randomNumbers = [];
  Random randomNumberGenerator = new Random();
  static final question = [
    {
      'questionText': 'Who is the CEO of Google?',
      'answerText': [
        'Mark Zuckerberg',
        'Sundar Pichai',
        'Bill Gates',
        'Elon Musk'
      ],
      'correctAnswer': 'Sundar Pichai'
    },
    {
      'questionText': 'Who among the following has not won Bharat Ratna?',
      'answerText': [
        'Mahatma Gandhi',
        'Nelson Mandela',
        'Sachin Tendulkar',
        'Lata Mangeshkar'
      ],
      'correctAnswer': 'Mahatma Gandhi'
    },
    {
      'questionText': 'Who is current minister of finance in India?',
      'answerText': [
        'Amit Shah',
        'Nitin Gadkari',
        'Nirmala Sitharaman',
        'Arun Jaitly'
      ],
      'correctAnswer': 'Nirmala Sitharaman'
    },
    {
      'questionText': 'Which is the highest mountain peak in India?',
      'answerText': [
        'Mount Everest',
        'Aanapara',
        'Nanda Devi',
        'Kangchenjunga'
      ],
      'correctAnswer': 'Kangchenjunga'
    },
    {
      'questionText': 'What is the capital of Arunanchal Pradesh?',
      'answerText': ['Imphal', 'Aizwal', 'Itanagar', 'Agartala'],
      'correctAnswer': 'Itanagar'
    },
    {
      'questionText': 'What do you call a group of Jellyfish?',
      'answerText': ['A cluster', 'A smack', 'A school', 'A fraternity'],
      'correctAnswer': 'A smack'
    },
    {
      'questionText':
          'Which is the tallest mountain in the world when measured from its base?',
      'answerText': ['Mauna Kea', 'Mount Everest', 'Kilimanjaro', 'Shashi'],
      'correctAnswer': 'Mauna Kea'
    },
    {
      'questionText': 'Who is the director of 3 Idiots?',
      'answerText': [
        'Anurag Basu',
        'Sajay Leela Bansali',
        'Aamir Khan',
        'Rajkumar Hirani'
      ],
      'correctAnswer': 'Rajkumar Hirani'
    },
    {
      'questionText': 'Which actor is the owner of NorthEast United FC?',
      'answerText': [
        'Akshay Kumar',
        'Hrithik Roshan',
        'Abhishek Bachchan',
        'John Abraham'
      ],
      'correctAnswer': 'John Abraham'
    },
    {
      'questionText':
          'Which one of the following lenses should be used to treat astigmatism?',
      'answerText': [
        'Concave lens',
        'Convex lens',
        'Bifocal lens',
        'Cylendrical lens'
      ],
      'correctAnswer': 'Cylendrical lens'
    },
  ];

  _QuizAppState() {
    questionNumber = randomNumberGenerator.nextInt(question.length - 1);
    randomNumbers.add(questionNumber);
  }

  void checkAnswer(int qno, String ans) {
    setState(() {
      if (ans == question[qno]['correctAnswer']) {
        score += 1;

        questionNumber = randomNumberGenerator.nextInt(question.length - 1);
        while (randomNumbers.contains(questionNumber)) {
          questionNumber = randomNumberGenerator.nextInt(question.length - 1);
        }
        randomNumbers.add(questionNumber);
      } else {
        score -= 1;
        Fluttertoast.showToast(
            msg: "Wrong Answer",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIos: 1,
            backgroundColor: Colors.black12,
            textColor: Colors.white,
            fontSize: 16.0);
      }
    });
  }

  void resetQuiz() {
    setState(() {
      score = 0;
      questionNumber = randomNumberGenerator.nextInt(question.length - 1);
      randomNumbers = [questionNumber];
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            "YOU CAN ALSO BE KODEESHWARAN",
            style: GoogleFonts.lato(
              textStyle: TextStyle(
                fontSize: 18,
                color: Colors.white70,
              ),
            ),
          ),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.replay),
              onPressed: resetQuiz,
            )
          ],
        ),
        body: randomNumbers.length <= 5
            ? Container(
                height: double.infinity,
                width: double.infinity,
                margin: EdgeInsets.only(left: 15, right: 15),
                child: Quiz(
                  question: question,
                  questionNumber: questionNumber,
                  score: score,
                  checkAnswer: checkAnswer,
                  questionCounter: randomNumbers.length,
                ),
              )
            : GameOver(score),
        floatingActionButton: FloatingActionButton(
            child: Icon(
              Icons.replay,
              color: Colors.white,
              size: 30,
            ),
            onPressed: resetQuiz,
            backgroundColor: Colors.black12),
            floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      ),
    );
  }
}
