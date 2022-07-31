import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../provider/items_provider.dart';
import '../../widgets/bottom_nav.dart';
import '../../widgets/items_grid.dart';
import '../../widgets/menu_button.dart';
import '../../widgets/search.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => HomeState();
}

class HomeState extends State<Home> {
  int page = 0;
  List<bool> isSelected = [
    true,
    false,
  ];

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
              child: ToggleButtons(
                  borderRadius: BorderRadius.circular(8.0),
                  isSelected: isSelected,
                  onPressed: ((_) {
                    Provider.of<RentalItems>(context, listen: false)
                        .toggleIsAllModelsSelected();
                    setState(() {
                      isSelected[0] = !isSelected[0];
                      isSelected[1] = !isSelected[1];
                    });
                  }),
                  children: const [
                    Padding(
                      padding: EdgeInsets.symmetric(
                        vertical: 12.0,
                        horizontal: 20.0,
                      ),
                      child: Text("All Models"),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        vertical: 12.0,
                        horizontal: 20.0,
                      ),
                      child: Text("New Models"),
                    ),
                  ]

                  //  TabBar(
                  //   isScrollable: true,
                  //   tabs: const [
                  //     Tab(text: 'All models'),
                  //     Tab(text: 'New models'),
                  //   ],
                  //   indicator: BoxDecoration(
                  //     color: StoreTheme.primaryColor,
                  //     borderRadius: BorderRadius.circular(100),
                  //   ),
                  //   labelColor: StoreTheme.white,
                  //   unselectedLabelColor: StoreTheme.black,
                  // ),
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
