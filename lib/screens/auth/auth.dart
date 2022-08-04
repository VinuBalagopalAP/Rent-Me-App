import 'package:flutter/material.dart';

import '../../utils/theme.dart';
import '../../screens/home/home.dart';
import 'widgets/email_field.dart';
import 'widgets/password_field.dart';

class AuthPage extends StatefulWidget {
  static const routeName = '/auth';

  const AuthPage({Key? key}) : super(key: key);

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  /// [ Form Key ] is used to validate the form.
  final _formKey = GlobalKey<FormState>();

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
      onTap: () {},
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

    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        body: SafeArea(
          child: Form(
            key: _formKey,
            child: Padding(
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
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const Home(),
              ),
            );

            debugPrint('Google Login');

            // final provider = Provider.of<GoogleSignInProvider>(
            //   context,
            //   listen: false,
            // );

            // provider.googleLogin();
          },
          label: const Text('Login'),
          foregroundColor: StoreTheme.white,
          backgroundColor: StoreTheme.blueGrey,
          icon: const Icon(Icons.login_rounded),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        backgroundColor: StoreTheme.primaryColor,
      ),
    );
  }
}
