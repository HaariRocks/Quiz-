import 'package:quiz/question.dart';

class QuizBrain {
  int _questionNumber = 0;
  List<Question> _questionlist = [
    Question('The tango originated in Argentina.', true),
    Question(
        'The Oscar-winning film A Beautiful Mind (2001) deals with schizophrenia.',
        true),
    Question(
        'Veins look blue because the oxygen-depleted blood in them is blue.',
        false),
    Question('Spiders belong to the "insect" class of animals.', false),
    Question(
        'Death Valley is the lowest, hottest, and driest area of North America.',
        true),
    Question('Volleyball was invented as a game for businessmen.', true),
    Question('King Tut was one of the longest-reigning kings of ancient Egypt.',
        false)
  ];

  String getQuestions() {
    return _questionlist[_questionNumber].questionText;
  }

  bool getAnswers() {
    return _questionlist[_questionNumber].answerText;
  }

  void nextQuestion() {
    if (_questionNumber < _questionlist.length - 1) {
      _questionNumber++;
    }
  }

  bool isFinished() {
    if (_questionNumber >= _questionlist.length - 1) {
      print("yes! it reached end !");
      return true;
    } else {
      return false;
    }
  }

  void reset() {
    _questionNumber = 0;
  }
}
