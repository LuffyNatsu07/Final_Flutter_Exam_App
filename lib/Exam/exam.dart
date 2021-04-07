import 'package:flutter/material.dart';
import 'package:exam_app/Exam/quiz.dart';
import 'package:exam_app/Exam/result.dart';

import '../constant.dart';

class ExamScreen extends StatefulWidget {
  static const String id = 'exam_screen';
  @override
  _ExamScreenState createState() => _ExamScreenState();
}

class _ExamScreenState extends State<ExamScreen> {
  var questionIndex = 0;
  var totalScore = 0;

  void resetQuiz() {
    setState(() {
      questionIndex = 0;
      totalScore = 0;
    });
  }

  void answerQuestion(int score) {
    totalScore += score;

    setState(() {
      questionIndex = questionIndex + 1;
    });
    print(questionIndex);
    if (questionIndex < questions.length) {
      print('We have more questions!');
    } else {
      print('No more questions!');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryLightColor,
      appBar: AppBar(
        title: Text('Flutter Exam'),
        backgroundColor: Colors.lightGreen,
      ),
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: questionIndex < questions.length
            ? Quiz(
                answerQuestion: answerQuestion,
                questionIndex: questionIndex,
                questions: questions,
              ) //Quiz
            : Result(totalScore, resetQuiz),
      ),
    );
  }
}
