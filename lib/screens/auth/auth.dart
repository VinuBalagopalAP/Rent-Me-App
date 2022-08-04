import 'package:flutter/material.dart';

import '../../screens/auth/widgets/login_section.dart';
import '../../utils/theme.dart';
import '../../screens/home/home.dart';

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
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        body: SafeArea(
          child: Form(
            key: _formKey,
            child: const LoginSection(),
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
