import 'package:flutter/material.dart';
import '../../widgets/bottom_nav.dart';
import '../../widgets/items_grid.dart';
import '../../widgets/menu_button.dart';
import '../../widgets/search.dart';
import '/utils/theme.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => HomeState();
}

class HomeState extends State<Home> {
  int page = 0;

  void updatePage(int x) {
    setState(() {
      page = x;
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          leading: const MenuButton(),
          actions: actionButtons,
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const StoreSearch(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TabBar(
                isScrollable: true,
                tabs: const [
                  Tab(text: 'All models'),
                  Tab(text: 'New models'),
                ],
                indicator: BoxDecoration(
                  color: StoreTheme.primaryColor,
                  borderRadius: BorderRadius.circular(100),
                ),
                labelColor: StoreTheme.white,
                unselectedLabelColor: StoreTheme.black,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const ItemsGridView(),
          ],
        ),
        bottomNavigationBar: StoreBottomNavigation(
          page: page,
          updatePage: updatePage,
        ),
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
