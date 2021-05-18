import 'package:flutter/material.dart';
import 'package:quiz_time/service/question_bank.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Questions quiz;
  List<Icon> score = [];
  Color? color;
  int? selected;

  void checkAnswer(String selectedAnswer) async {
    String correctAnswer = quiz.getAnswer();
    if (selectedAnswer == correctAnswer) {
      quiz.correct();
      setState(() {
        score.add(Icon(
          Icons.check,
          color: Colors.green,
        ));
        color = Colors.green;
      });
    } else {
      quiz.wrong();
      setState(() {
        score.add(Icon(
          Icons.close,
          color: Colors.red,
        ));
        color = Colors.red;
      });
    }

    await Future.delayed(Duration(seconds: 1));
    setState(() {
      selected = -1;
    });

    int qNo = quiz.nextQuestion();
    if (qNo == -1) {
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) {
          return AlertDialog(
            title: Text('Quiz Summary'),
            content: SingleChildScrollView(
              child: ListBody(
                children: <Widget>[
                  Text(
                    'Total Questions: ${quiz.total()}',
                    style: TextStyle(
                      color: Colors.blueGrey,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'Correct Answer: ${quiz.correct()}',
                    style: TextStyle(
                      color: Colors.green,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'Wrong Answer: ${quiz.wrong()}',
                    style: TextStyle(
                      color: Colors.red,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            actions: <Widget>[
              TextButton(
                child: Text('Okay'),
                onPressed: () {
                  setState(() {
                    quiz.reset();
                    score.clear();
                  });
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    }
  }

  @override
  void initState() {
    quiz = Questions();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: Column(
        children: <Widget>[
          Expanded(
            child: Center(
              child: Text(
                quiz.getQuestion(),
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 25.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          ListView.builder(
            shrinkWrap: true,
            itemCount: quiz.getOptions().length,
            itemBuilder: (context, index) => Card(
              margin: EdgeInsets.all(8),
              shadowColor: Colors.blueGrey[900],
              child: MaterialButton(
                textColor: Colors.white,
                color: selected == index ? color : Colors.blueGrey[800],
                child: Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Text(
                    quiz.getOptions()[index],
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20.0,
                    ),
                  ),
                ),
                onPressed: () {
                  selected = index;
                  checkAnswer(quiz.getOptions()[index]);
                },
              ),
            ),
          ),
          Container(
            alignment: Alignment.centerLeft,
            height: 20,
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              reverse: true,
              child: Row(children: score),
            ),
          )
        ],
      ),
    );
  }
}
