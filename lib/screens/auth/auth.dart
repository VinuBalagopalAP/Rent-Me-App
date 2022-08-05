import 'package:flutter/material.dart';

import '../../utils/theme.dart';
import 'widgets/auth_section.dart';

class AuthPage extends StatefulWidget {
  static const routeName = '/auth';

  const AuthPage({Key? key}) : super(key: key);

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  /// [ Form Key ] is used to validate the form.
  final _formKey = GlobalKey<FormState>();

  bool _toggleSection = true;

  @override
  Widget build(BuildContext context) {
    final account = GestureDetector(
      onTap: () {
        setState(() {
          _toggleSection = !_toggleSection;
        });
      },
      child: Container(
        alignment: Alignment.center,
        child: RichText(
          text: TextSpan(
            text: _toggleSection
                ? "Don't have an account?"
                : "Already have an account?",
            style: const TextStyle(
              fontSize: 12.0,
              color: Colors.black,
              decoration: TextDecoration.underline,
            ),
            children: <TextSpan>[
              TextSpan(
                text: _toggleSection ? ' Sign up' : ' Login',
                style: const TextStyle(
                  fontSize: 12.0,
                  fontWeight: FontWeight.bold,
                  color: StoreTheme.whitish,
                  decoration: TextDecoration.none,
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
          child: Center(
            child: SingleChildScrollView(
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    _toggleSection
                        ? const LoginSection()
                        : const SignUpSection(),
                    account,
                    const SizedBox(height: 10.0),
                    const Text('or', style: TextStyle(fontSize: 12.0)),
                    const GoogleButton(),
                  ],
                ),
              ),
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () {},
          label: _toggleSection ? const Text('Login') : const Text('Sign Up'),
          foregroundColor: StoreTheme.white,
          backgroundColor: StoreTheme.blueGrey,
          icon: _toggleSection
              ? const Icon(Icons.login_rounded)
              : const Icon(Icons.person_add_rounded),
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
