import 'package:quiz_app/model/question.dart';

class Questions {
  int _qNo = 0;

  List<Question> _questions = [
    Question(
      question: "Who is the owner of this project ?",
      options: ["Me", "You", "He", "She"],
      answer: "Me",
    ),
  ];

  String getQuestion() {
    return _questions[_qNo].question;
  }

  List<String> getOptions() {
    return _questions[_qNo].options;
  }

  String getAnswer() {
    return _questions[_qNo].answer;
  }
}
