import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int resultScore;
  final Function resetHandler;

  Result(this.resultScore, this.resetHandler);

  String get resultPhrase {
    var resultText = 'You did it!';
    if (resultScore == 3) {
      resultText = 'Excellent!';
    } else if (resultScore == 2) {
      resultText = 'Good!';
    } else if (resultScore == 1) {
      resultText = 'Could be better!';
    } else {
      resultText = 'Don\'t skip Geography class!';
    }
    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(children: <Widget>[
      Text(
        resultPhrase,
        style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
        textAlign: TextAlign.center,
      ),
      FlatButton(
          onPressed: resetHandler,
          textColor: Colors.blue,
          child: Text('Restart quiz')),
    ]));
  }
}
