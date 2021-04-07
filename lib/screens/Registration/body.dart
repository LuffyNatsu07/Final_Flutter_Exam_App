import 'package:exam_app/components/rounded_button.dart';
import 'package:exam_app/components/rounded_input_field.dart';
import 'package:exam_app/components/rounded_password_field.dart';
import 'package:exam_app/screens/login/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'background.dart';
import 'package:exam_app/Exam/exam.dart';

import 'package:firebase_auth/firebase_auth.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  final _auth = FirebaseAuth.instance;

  // bool showSpinner = false;
  String email;
  String password;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "Registration",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: size.height * 0.03),
            SvgPicture.asset(
              "assets/icons/signup.svg",
              height: size.height * 0.35,
            ),
            RoundedInputField(
              hintText: "Your Email",
              onChanged: (value) {
                email = value;
              },
            ),
            RoundedPasswordField(
              onChanged: (value) {
                password = value;
              },
            ),
            RoundedButton(
              press: () async {
                try {
                  final newUser = await _auth.createUserWithEmailAndPassword(
                      email: email, password: password);
                  if (newUser != null) {
                    Navigator.pushNamed(context, ExamScreen.id);
                  }
                } catch (e) {
                  print(e);
                }
              },
              text: "Register",
            ),
            TextButton(
              child: Text(
                'Already Registered? Login',
                style: TextStyle(fontSize: 16),
              ),
              onPressed: () {
                Navigator.pushNamed(context, LoginScreen.id);
              },
            )
          ],
        ),
      ),
    );
  }
}
