import 'package:flutter/material.dart';

import './answer.dart';
import './question.dart';

class Quiz extends StatelessWidget {
  final List<Map<String, Object>> _questions;
  final int _id;
  final void Function(int) _answerQuestion;

  Quiz(this._questions, this._id, this._answerQuestion);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Question(
          _questions[_id]['questionText'].toString(),
        ),
        ...(_questions[_id]['answers'] as List<Map<String, Object>>).map((answer) {
          return Answer(() => _answerQuestion(answer['score'] as int), answer['text'].toString());
        }).toList(),
      ],
    );
  }
}
