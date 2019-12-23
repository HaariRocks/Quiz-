import 'package:flutter/material.dart';
import 'package:quiz/quizBrain.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.teal.shade100,
        appBar: AppBar(),
        body: SafeArea(
            child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          child: QuizPage(),
        )),
      ),
    );
  }
}

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  List<Widget> scoreKeeper = [];
  void userPicked(bool userPicked) {
    var currectAnswer = quizBrain.getAnswers();
    setState(() {
      if (quizBrain.isFinished() == true) {
        Alert(context: context, title: "Finished", desc: "Completed the Quiz")
            .show();
        quizBrain.reset();
        scoreKeeper = [];
      }

      if (userPicked == currectAnswer) {
        scoreKeeper.add(Icon(Icons.check, color: Colors.green));
      } else {
        scoreKeeper.add(Icon(Icons.clear, color: Colors.red));
      }
      quizBrain.nextQuestion();
    });
  }

  QuizBrain quizBrain = QuizBrain();
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          flex: 7,
          child: Center(
            child: Text(
              quizBrain.getQuestions(),
              style: TextStyle(
                  color: Colors.blue,
                  fontSize: 20,
                  fontStyle: FontStyle.italic),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: FlatButton(
              color: Colors.blue.shade400,
              onPressed: () {
                userPicked(true);
              },
              child: Text("True"),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: FlatButton(
              color: Colors.red.shade200,
              onPressed: () {
                userPicked(false);
              },
              child: Text("False"),
            ),
          ),
        ),
        Row(
          children: scoreKeeper,
        ),
      ],
    );
  }
}
