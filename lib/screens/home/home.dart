import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rent_me/models/item.dart';
import 'package:rent_me/provider/items_provider.dart';
import 'package:rent_me/screens/details/details.dart';
import '../../utils/slide.dart';
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
                    Text("All Models"),
                    Text("New Models"),
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
      IconButton(
        onPressed: () {
          showSearch(context: context, delegate: CustomSearchDelegate());
        },
        icon: const Icon(Icons.search),
      )
    ];
  }
}

class CustomSearchDelegate extends SearchDelegate {
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: () {
            query = '';
          },
          icon: const Icon(Icons.clear))
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        close(context, null);
      },
      icon: const Icon(Icons.arrow_back),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    log('hello');
    return SearchList(query: query);
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return query.isEmpty ? Column() : SearchList(query: query);
  }
}

class SearchList extends StatelessWidget {
  final String query;
  const SearchList({required this.query, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = Provider.of<RentalItems>(context);

    List<Item> results = query != null
        ? model.getItems
            .where((ex) => ex.name.toLowerCase().contains(query.toLowerCase()))
            .toList()
        : model.getItems;

    return ListView.builder(
      itemCount: results.length,
      itemBuilder: (context, position) {
        var item = results[position];
        return ChangeNotifierProvider.value(
          value: item,
          child: GestureDetector(
              onTap: () => Navigator.push(
                    context,
                    slidingRoute(ItemDetails(item)),
                  ),
              child: ListTile(title: Text(item.name))),
        );
      },
    );
  }
}
