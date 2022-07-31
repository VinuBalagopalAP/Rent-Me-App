import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rent_me/screens/menu/menu.dart';

import '../../provider/home_navigation_provider.dart';
import '../../widgets/bottom_nav.dart';
import '../../widgets/menu_button.dart';
import '../cart/cart_screen.dart';
import '../profile/profile.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => HomeState();
}

class HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    final homeNav = Provider.of<HomeNavigation>(context);

    final List<Widget> pages = [
      const Menu(),
      const CartScreen(),
      const LoginPage(),
    ];

    Widget bodyWidget() {
      return pages[homeNav.currentIndex];
    }

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          leading: const MenuButton(),
          actions: actionButtons,
        ),
        body: bodyWidget(),
        bottomNavigationBar: const StoreBottomNavigation(),
      ),
    );
  }

  List<Widget> get actionButtons {
    return [
      IconButton(
        onPressed: () {},
        icon: const Icon(Icons.notifications_outlined),
      ),
      IconButton(
        onPressed: () {},
        icon: const Icon(Icons.settings_outlined),
      ),
    ];
  }
}
