import 'package:exam_app/components/rounded_button.dart';
import 'package:flutter/material.dart';

import '../constant.dart';

class Answer extends StatelessWidget {
  final Function selectHandler;
  final String answerText;

  Answer(this.selectHandler, this.answerText);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: RoundedButton(
        color: Colors.purple.shade300,
        textColor: Colors.white,
        text: answerText,
        press: selectHandler,
      ),
    );
  }
}
