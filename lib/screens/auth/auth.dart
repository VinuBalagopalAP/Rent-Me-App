import 'package:flutter/material.dart';
import 'package:rent_me/utils/theme.dart';

import '../../screens/home/home.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
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
                    const SizedBox(
                      height: 10,
                    ),
                    // Padding(
                    //   padding: const EdgeInsets.symmetric(vertical: 20.0),
                    //   child: Material(
                    //     elevation: 5.0,
                    //     color: Colors.white,
                    //     borderRadius: BorderRadius.circular(5.0),
                    //     child: MaterialButton(
                    //       onPressed: () {
                    // final provider = Provider.of<GoogleSignInProvider>(
                    //   context,
                    //   listen: false,
                    // );

                    // provider.googleLogin();

                    //         Navigator.push(
                    //           context,
                    //           MaterialPageRoute(
                    //             builder: (context) => const Home(),
                    //           ),
                    //         );

                    //         debugPrint('Google Login');
                    //       },
                    //       minWidth: 200.0,
                    //       height: 42.0,
                    //       child: const Text(
                    //         'Login with Google',
                    //         style: TextStyle(
                    //           color: Colors.blueGrey,
                    //         ),
                    //       ),
                    //     ),
                    //   ),
                    // ),
                    const SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ),
            ],
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
        label: const Text('Login with Google'),
        foregroundColor: StoreTheme.white,
        backgroundColor: StoreTheme.blueGrey,
        icon: const Icon(Icons.login_rounded),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      backgroundColor: StoreTheme.primaryColor,
    );
  }
}
