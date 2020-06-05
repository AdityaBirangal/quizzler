import 'package:flutter/material.dart';
import 'package:quizzler/quiz_brain.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:audioplayers/audio_cache.dart';

QuizBrain quizBrain = QuizBrain();

void main() => runApp(Quizzler());

class Quizzler extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey.shade900,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: QuizPage(),
          ),
        ),
      ),
    );
  }
}

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  List<Icon> scoreKeeper = [];

  void checkAns(bool userAns) {
    setState(() {
      if (quizBrain.queNum() >= quizBrain.queEnd()) {
        Alert(
                context: context,
                title: "Finished!",
                desc: "You\'ve reached the end of the quiz.")
            .show();
        scoreKeeper = [];
        quizBrain.queRe();
      } else {
        if (userAns == quizBrain.getAns()) {
          scoreKeeper.add(Icon(
            Icons.check,
            color: Colors.green,
          ));
          final player = AudioCache();
          player.play('right.wav');
        } else {
          scoreKeeper.add(Icon(
            Icons.close,
            color: Colors.red,
          ));
          final player = AudioCache();
          player.play('wrong.mp3');
        }
        quizBrain.nextQue();
      }
    });
  }

//  List<String> question = [
//    'You can lead a cow down stairs but not up stairs.',
//    'Approximately one quarter of human bones are in the feet.',
//    'A slug\'s blood is green.',
//  ];
//
//  List<bool> ans = [
//    false,
//    true,
//    true,
//  ];

//  List<Question> quetionsList = [
//    Question(q: 'You can lead a cow down stairs but not up stairs.', a: false),
//    Question(
//        q: 'Approximately one quarter of human bones are in the feet.',
//        a: true),
//    Question(q: 'A slug\'s blood is green.', a: true),
//  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          flex: 5,
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                quizBrain.getQue(),
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 25.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: FlatButton(
              textColor: Colors.white,
              color: Colors.green,
              child: Text(
                'True',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                ),
              ),
              onPressed: () {
                checkAns(true);
                //The user picked true.
              },
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: FlatButton(
              color: Colors.red,
              child: Text(
                'False',
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                ),
              ),
              onPressed: () {
                checkAns(false);
                //The user picked false.
              },
            ),
          ),
        ),
        Row(
          children: scoreKeeper,
        )
        //TODO: Add a Row here as your score keeper
      ],
    );
  }
}

/*
question1: 'You can lead a cow down stairs but not up stairs.', false,
question2: 'Approximately one quarter of human bones are in the feet.', true,
question3: 'A slug\'s blood is green.', true,
*/
