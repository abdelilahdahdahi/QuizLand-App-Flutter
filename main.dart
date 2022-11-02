//import 'package:first_app/result.dart';
import 'package:flutter/material.dart';

//importing the files that contain necessary data
import './quiz.dart';
import './result.dart';

//void main() {
//  runApp(MyApp());
//}

// An alternative way to run MyApp:
void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  final _questions = const [
    //List of Maps, List<Map>[]
    //Map is a data structure of {key:value}
    {
      'questionText': 'What\'s your favorite color? ',
      'answers': [
        {'text': 'Black', 'score': 10},
        {'text': 'Red', 'score': 7},
        {'text': 'Green', 'score': 3},
        {'text': 'White', 'score': 1}
      ],
    },
    {
      'questionText': 'What\'s your favorite film?',
      'answers': [
        {'text': 'Apollo 11', 'score': 11},
        {'text': 'Joker', 'score': 14},
        {'text': 'Spiderman', 'score': 9},
        {'text': '1917', 'score': 12}
      ]
    },
    {
      'questionText': 'What are you currently learning?',
      'answers': [
        {'text': 'Flutter', 'score': 15},
        {'text': 'Javascript', 'score': 11},
        {'text': 'Python', 'score': 10},
        {'text': 'PHP', 'score': 1}
      ]
    }
  ];
  var _questionIndex = 0;
  var _totalScore = 0;

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  void _answerQuestion(int score) {
    _totalScore += score;

    setState(() {
      _questionIndex += 1;
    });

    print(_questionIndex);
    if (_questionIndex < _questions.length) {
      print('We have more questions!');
    } else {
      print('No more questions!');
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: Text('My first App'),
          ),
          body: _questionIndex <
                  _questions.length //condition to show the content (questions)
              ? Quiz(
                  answerQuestion: _answerQuestion,
                  questionIndex: _questionIndex,
                  questions: _questions,
                )
              //else:
              : Result(_totalScore, _resetQuiz)),
    );
  }
}
