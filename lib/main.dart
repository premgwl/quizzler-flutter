import 'package:flutter/material.dart';

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
  List<Icon> checkBoxes = [];

  List<String> questions = [
    "The letter H is between letters G and J on a keyboard",
    "Camels have three sets of eyelashes",
    "New York is nicknamed 'The Big Orange'",
    "Your hand has a built in snuff box",
    "The moon is just 50 percent of the mass of Earth.",
    "Apes cant laugh.",
  ];

  List<bool> answers = [true, false, false, true, false, false];

  int questionNumber = 0;

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
                questions[questionNumber % questions.length],
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
            child: TextButton(
              style: TextButton.styleFrom(
                  backgroundColor: Colors.green,
                  textStyle: TextStyle(color: Colors.white)),
              child: Text(
                'True',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                ),
              ),
              onPressed: () {
                bool answer = answers[questionNumber % questions.length];

                setState(() {
                  if (answer) {
                    checkBoxes.add(Icon(
                      Icons.check,
                      color: Colors.green,
                    ));
                  } else {
                    checkBoxes.add(Icon(
                      Icons.check,
                      color: Colors.red,
                    ));
                  }
                  questionNumber++;
                });
              },
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: TextButton(
              style: TextButton.styleFrom(
                  textStyle: const TextStyle(fontSize: 20),
                  backgroundColor: Colors.red),
              child: Text(
                'False',
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                ),
              ),
              onPressed: () {
                bool answer = answers[questionNumber % questions.length];
                setState(() {
                  if (!answer) {
                    checkBoxes.add(Icon(
                      Icons.check,
                      color: Colors.green,
                    ));
                  } else {
                    checkBoxes.add(Icon(
                      Icons.check,
                      color: Colors.red,
                    ));
                  }

                  questionNumber++;
                });
              },
            ),
          ),
        ),
        Row(
          children: checkBoxes,
        )
      ],
    );
  }
}

/*
question1: 'You can lead a cow down stairs but not up stairs.', false,
question2: 'Approximately one quarter of human bones are in the feet.', true,
question3: 'A slug\'s blood is green.', true,
*/
