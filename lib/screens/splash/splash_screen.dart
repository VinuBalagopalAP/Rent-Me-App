import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:rent_me/screens/auth/auth.dart';

import '../../utils/theme.dart';
import '../home/home.dart';

class SplashScreen extends StatelessWidget {
  /// [ routeName ] is the name of the route that will be used to navigate to the next screen.
  static const routeName = '/';

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
          // return const AuthPage();

          return StreamBuilder(
            stream: FirebaseAuth.instance.authStateChanges(),
            builder: (context, snapshot) {
              switch (snapshot.connectionState) {

                /// [ Waiting ] for [ FirebaseAuth.instance.currentUser ] to be set.
                case ConnectionState.waiting:

                  /// [ Circular progress indicator ] is shown while waiting for [ FirebaseAuth.instance.currentUser ] to be set.
                  return const Center(
                    child: CircularProgressIndicator(),
                  );

                /// [ ConnectionState.active ] is reached when [ FirebaseAuth.instance.currentUser ] is set.
                case ConnectionState.active:

                  /// [ snapshot.hasData ] to show [ HomePage ] if the user is logged in.
                  if (snapshot.hasData) {
                    debugPrint("User is logged in");
                    return const Home();
                  }

                  /// [ AuthPage ] is shown if the user is not logged in.
                  debugPrint("User not logged in");
                  return const AuthPage();

                default:

                  /// [ snapshot.hasError ] to show Error message if any error occurs
                  if (snapshot.hasError) {
                    return const Center(
                      child: Text('An error occurred'),
                    );
                  }

                  /// [ AuthPage ] is shown if the user is not logged in.
                  debugPrint("User not logged in");
                  return const AuthPage();
              }
            },
          );
        },
        duration: 3000,
        backgroundColor: StoreTheme.primaryColor,
        splashTransition: SplashTransition.fadeTransition,
      ),
    );
  }
}
