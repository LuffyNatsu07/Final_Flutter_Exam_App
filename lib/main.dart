import 'package:flutter/material.dart';
import 'package:exam_app/screens/welcome_screen.dart';
import 'file:///C:/My%20files/Android%20project/exam_app/lib/screens/login/login_screen.dart';
import 'file:///C:/My%20files/Android%20project/exam_app/lib/screens/Registration/registration_screen.dart';
import 'package:exam_app/Exam/exam.dart';
import 'constant.dart';

void main() => runApp(Exam());

class Exam extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Exam App',
      theme: ThemeData(
        primaryColor: kPrimaryColor,
        scaffoldBackgroundColor: Colors.white
      ),
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
