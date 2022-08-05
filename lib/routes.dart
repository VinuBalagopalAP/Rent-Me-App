import 'package:flutter/material.dart';

import '../../screens/auth/widgets/auth_section.dart';
import '../../screens/screens.dart';

class MyRoutes {
  static Route<dynamic> myRoutes(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(
          builder: (context) => const SplashScreen(),
        );

      case '/auth':
        return MaterialPageRoute(
          builder: (context) => const AuthPage(),
        );

      case '/home':
        return MaterialPageRoute(
          builder: (context) => const Home(),
        );

      case '/signup':
        return MaterialPageRoute(
          builder: (context) => const SignUpSection(),
        );

      case '/login':
        return MaterialPageRoute(
          builder: (context) => const LoginSection(),
        );

      case '/menu':
        return MaterialPageRoute(
          builder: (context) => const Menu(),
        );
      case '/cart':
        return MaterialPageRoute(
          builder: (context) => const CartScreen(),
        );

      case '/profile':
        return MaterialPageRoute(
          builder: (context) => const ProfilePage(),
        );
    }
    return MaterialPageRoute(
      builder: (context) => const SplashScreen(),
    );
  }
}
