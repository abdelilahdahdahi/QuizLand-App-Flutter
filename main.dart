//import 'package:first_app/result.dart';
import 'package:flutter/material.dart';

//importing the files that contain necessary data
import './quiz.dart';
import './result.dart';

//void main() {
//  runApp(MyApp());
//}

// A better practice to run MyApp:
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
      'questionText': 'What\'s the capital of Russia? ',
      'answers': [
        {'text': 'Sidney', 'score': 0},
        {'text': 'Doha', 'score': 0},
        {'text': 'Mumbai', 'score': 0},
        {'text': 'Moscow', 'score': 1}
      ],
    },
    {
      'questionText': 'What\'s the capital of Morocco?',
      'answers': [
        {'text': 'Casablanca', 'score': 0},
        {'text': 'Istanbul', 'score': 0},
        {'text': 'Rabat', 'score': 1},
        {'text': 'Marrakech', 'score': 0}
      ]
    },
    {
      'questionText': 'What\'s the capital of Ghana?',
      'answers': [
        {'text': 'Dakhla', 'score': 0},
        {'text': 'Tripoli', 'score': 0},
        {'text': 'Accra', 'score': 1},
        {'text': 'Abidjan', 'score': 0}
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
