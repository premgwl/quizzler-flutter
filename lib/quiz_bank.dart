import 'question.dart';

class QuizBank {
  int _questionNumber = 0;

  List<Question> _questions = [
    Question("The letter H is between letters G and J on a keyboard", true),
    Question("Camels have three sets of eyelashes", true),
    Question("New York is nicknamed 'The Big Orange'", false),
    Question("Your hand has a built in snuff box", false),
    Question("The moon is just 50 percent of the mass of Earth.", false),
  ];

  Question getQuestions() {
    return _questions[_questionNumber];
  }

  void nextQuestion() {
    if (_questionNumber + 1 < _questions.length) {
      _questionNumber++;
    }
  }

  bool isQuizOver() {
    if (_questionNumber + 1 == _questions.length) {
      return true;
    }

    return false;
  }

  void resetQuiz() {
    _questionNumber = 0;
  }
}
