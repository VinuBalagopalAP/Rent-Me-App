import 'package:flutter/material.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';

import '../../utils/theme.dart';
import '../auth/auth.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen.withScreenFunction(
      splash: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Text(
            'Rent',
            style: TextStyle(
                color: Colors.white, fontSize: 70, fontFamily: 'MusticaPro'),
          ),
          Text(
            'Me',
            style: TextStyle(
                color: Colors.black, fontSize: 70, fontFamily: 'MusticaPro'),
          ),
        ],
      ),
      screenFunction: () async {
        return const AuthPage();
      },
      duration: 3000,
      backgroundColor: StoreTheme.blueGrey,
      splashTransition: SplashTransition.fadeTransition,
    );
  }
}
