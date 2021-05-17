import 'package:flutter/material.dart';
import 'package:quiz_app/view/home.dart';

void main() => runApp(QuizApp());

class QuizApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Quiz Time',
      home: Home(),
    );
  }
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[900],
      appBar: AppBar(
        backgroundColor: Colors.blueGrey[800],
        title: Text('Quiz Time', style: TextStyle(fontWeight: FontWeight.bold)),
        centerTitle: true,
      ),
      body: HomePage(),
    );
  }
}
