import 'package:flutter/material.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';

import '../../utils/theme.dart';
import '../auth/auth.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedSplashScreen.withScreenFunction(
        splash: Row(
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

        /// [ screenFunction ] is used to show the [ AuthPage ] if the user is logged in.
        screenFunction: () async {
          return const AuthPage();
        },
        duration: 3000,
        backgroundColor: StoreTheme.primaryColor,
        splashTransition: SplashTransition.fadeTransition,
      ),
    );
  }
}
