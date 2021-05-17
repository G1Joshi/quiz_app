import 'package:flutter/material.dart';
import 'package:quiz_app/service/question_bank.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Questions quiz;
  List<Icon> score = [];
  Color? color;
  int? selected;

  void checkAnswer(String selectedAnswer) {
    String correctAnswer = quiz.getAnswer();
    setState(() {
      if (selectedAnswer == correctAnswer) {
        score.add(Icon(
          Icons.check,
          color: Colors.green,
        ));
        color = Colors.green;
      } else {
        score.add(Icon(
          Icons.close,
          color: Colors.red,
        ));
        color = Colors.red;
      }
    });
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
            itemCount: 4,
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
