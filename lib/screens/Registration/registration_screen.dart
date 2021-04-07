import 'package:exam_app/Exam/exam.dart';
import 'package:exam_app/components/rounded_button.dart';
import 'package:exam_app/components/rounded_input_field.dart';
import 'package:exam_app/components/rounded_password_field.dart';
import 'package:exam_app/screens/welcome/component/background.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'body.dart';


class RegistrationScreen extends StatefulWidget {
  static const String id = 'registration_screen';
  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final _auth = FirebaseAuth.instance;

  // bool showSpinner = false;
  String email;
  String password;
  String name;



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(),
    );
  }
}

