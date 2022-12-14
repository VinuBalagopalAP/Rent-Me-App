import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../models/product/item.dart';
import '../../../provider/product/items_provider.dart';
import '../../details/details.dart';
import '../../../utils/slide.dart';

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
    debugPrint('Searching...');
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

    List<Item> results = query.isNotEmpty
        ? model.getItems
            .where(
                (item) => item.name.toLowerCase().contains(query.toLowerCase()))
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
            child: ListTile(title: Text(item.name)),
          ),
        );
      },
    );
  }
}
