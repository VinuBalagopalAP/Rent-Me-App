import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rent_me/screens/menu/menu.dart';

import '../../provider/home_navigation_provider.dart';
import '../../widgets/bottom_nav.dart';
import '../../widgets/menu_button.dart';
import '../../widgets/search.dart';
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
    /// [ homeNav ] is a [ HomeNavigationProvider ] which is used to change the current screen.
    final homeNav = Provider.of<HomeNavigation>(context);

    /// [ pages ] is a list of [ Widgets] which are used to display the current screen.
    final List<Widget> pages = [
      const Menu(),
      const CartScreen(),
      const ProfilePage(),
    ];

    Widget bodyWidget() {
      /// [ pages[homeNav.currentIndex] ] is used to display the current screen.
      return pages[homeNav.currentIndex];
    }

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          leading: const MenuButton(),
          actions: actionButtons,
        ),

        /// [ bodyWidget ] is a [ Stack ] which is used to display the current screen.
        body: bodyWidget(),

        /// [ StoreBottomNavigationBar ] is a [ BottomNavigationBar ] which is used to change the current screen.
        bottomNavigationBar: const StoreBottomNavigation(),
      ),
    );
  }

  /// [ actionButtons ] is a [ List ] of [ Widget ] which are used to display the current screen.
  List<Widget> get actionButtons {
    return [
      IconButton(
        onPressed: () {
          showSearch(context: context, delegate: CustomSearchDelegate());
        },
        icon: const Icon(Icons.search),
      ),
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
