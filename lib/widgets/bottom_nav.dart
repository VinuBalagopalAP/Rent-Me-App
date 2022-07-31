import 'package:flutter/material.dart';

class StoreBottomNavigation extends StatelessWidget {
  final int page;
  final ValueChanged<int> updatePage;

  const StoreBottomNavigation({
    Key? key,
    required this.page,
    required this.updatePage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: page,
      onTap: updatePage,
      type: BottomNavigationBarType.fixed,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: "Explore",
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
