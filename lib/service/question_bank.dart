import 'package:quiz_time/model/question.dart';

class Questions {
  int _qNo = 0;
  int _correct = 0;
  int _wrong = 0;

  List<Question> _questions = [
    Question(
      question: "1st question ?",
      options: ["Option 1", "Option 2", "Option 3", "Option 4"],
      answer: "Option 1",
    ),
    Question(
      question: "2nd question ?",
      options: ["Option 1", "Option 2", "Option 3", "Option 4"],
      answer: "Option 2",
    ),
    Question(
      question: "3rd question ?",
      options: ["Option 1", "Option 2", "Option 3", "Option 4"],
      answer: "Option 3",
    ),
    Question(
      question: "4th question ?",
      options: ["Option 1", "Option 2", "Option 3", "Option 4"],
      answer: "Option 4",
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

  int nextQuestion() {
    if (_qNo < _questions.length - 1) {
      _qNo++;
      return _qNo;
    }
    return -1;
  }

  int total() {
    return _questions.length;
  }

  int correct() {
    _correct++;
    return _correct - 1;
  }

  int wrong() {
    _wrong++;
    return _wrong - 1;
  }

  void reset() {
    _qNo = 0;
    _correct = 0;
    _wrong = 0;
  }
}
