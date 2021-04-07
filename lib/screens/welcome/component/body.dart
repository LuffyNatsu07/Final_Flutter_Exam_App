import 'package:exam_app/components/rounded_button.dart';
import 'package:exam_app/screens/Registration/registration_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../constant.dart';
import '../../login/login_screen.dart';
import 'background.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    // This size provide us total height and width of our screen
    return Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "Flutter Exam",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
            ),
            SizedBox(height: size.height * 0.07),
            SvgPicture.asset(
              "assets/icons/exam.svg",
              height: size.height * 0.35,
            ),
            SizedBox(height: size.height * 0.07),
            RoundedButton(
              text: "LOGIN",
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return LoginScreen();
                    },
                  ),
                );
              },
            ),
            SizedBox(
              height: 180,
            ),
            TextButton(
              child: Text(
                'New User? Create Account',
                style: TextStyle(fontSize: 16),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return RegistrationScreen();
                    },
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
