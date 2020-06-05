import 'question.dart';

class QuizBrain {
  int _queNum = 0;

  List<Question> _quetionsList = [
    Question('This App is Developed by Aditya', true),
    Question('Google was originally called \"Backrub\".', true),
    Question('Rahul Gandi is Prime Minister of India', false),
    Question('2 + 2 = 5', false),
    Question('Mumbai is Capital of Maharashtra', true),
  ];

  void nextQue() {
    if (_queNum < _quetionsList.length - 1) {
      _queNum++;
    } else {
      print('Last Quetion');
    }
  }

  String getQue() {
    return _quetionsList[_queNum].queText;
  }

  bool getAns() {
    return _quetionsList[_queNum].queAns;
  }

  int queNum() {
    return _queNum;
  }

  int queEnd() {
    return _quetionsList.length - 1;
  }

  int queRe() {
    _queNum = 0;
  }
}
