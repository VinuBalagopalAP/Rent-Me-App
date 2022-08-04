import 'package:flutter/material.dart';

import './email_field.dart';
import './password_field.dart';
import '../../../utils/theme.dart';

class LoginSection extends StatefulWidget {
  const LoginSection({Key? key}) : super(key: key);

  @override
  State<LoginSection> createState() => _LoginSectionState();
}

class _LoginSectionState extends State<LoginSection> {
  @override
  Widget build(BuildContext context) {
    final forgotPassword = Container(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      alignment: Alignment.topRight,
      child: const Text(
        "Forgot Password?",
        style: TextStyle(
          fontSize: 12.0,
          color: Colors.black,
        ),
      ),
    );

    final signUp = GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, '/signup', arguments: '');
      },
      child: Container(
        padding: const EdgeInsets.only(top: 10.0),
        alignment: Alignment.center,
        child: RichText(
          text: const TextSpan(
            text: "Don't have an account?",
            style: TextStyle(
              fontSize: 12.0,
              color: Colors.black,
              // decoration: TextDecoration.underline,
            ),
            children: <TextSpan>[
              TextSpan(
                text: ' Sign up',
                style: TextStyle(
                  fontSize: 12.0,
                  fontWeight: FontWeight.bold,
                  color: StoreTheme.whitish,
                  // decoration: TextDecoration.none,
                ),
              )
            ],
          ),
        ),
      ),
    );
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Flexible(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text(
                  'Rent',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 70,
                    fontFamily: 'MusticaPro',
                  ),
                ),
                Text(
                  'Me',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 70,
                    fontFamily: 'MusticaPro',
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
          const EmailField(),
          const SizedBox(height: 10),
          const PasswordField(),
          forgotPassword,
          signUp,
        ],
      ),
    );
  }
}
