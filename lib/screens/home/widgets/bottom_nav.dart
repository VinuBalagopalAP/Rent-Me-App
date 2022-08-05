import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../provider/menu/home_navigation_provider.dart';

class StoreBottomNavigation extends StatelessWidget {
  const StoreBottomNavigation({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final homeNav = Provider.of<HomeNavigation>(context);

    return BottomNavigationBar(
      currentIndex: homeNav.currentIndex,
      onTap: homeNav.setIndex,
      type: BottomNavigationBarType.fixed,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: "Explore",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.favorite),
          label: "Favorite",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.shopping_cart),
          label: "Cart",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: "Profile",
        ),
      ],
    );
  }
}
