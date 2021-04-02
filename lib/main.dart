import 'package:flutter/material.dart';
import 'package:exam_app/screens/welcome_screen.dart';
import 'package:exam_app/screens/login_screen.dart';
import 'package:exam_app/screens/registration_screen.dart';
import 'package:exam_app/Exam/exam.dart';

void main() => runApp(Exam());

class Exam extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: WelcomeScreen.id,
      routes: {
        WelcomeScreen.id:(context) => WelcomeScreen(),
        LoginScreen.id:(context)=> LoginScreen(),
        RegistrationScreen.id:(context)=> RegistrationScreen(),
        ExamScreen.id:(context) => ExamScreen(),
      },
    );
  }
}
