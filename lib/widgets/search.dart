import 'package:flutter/cupertino.dart';

import '../provider/items_provider.dart';
import '../utils/theme.dart';

class StoreSearch extends StatefulWidget {
  const StoreSearch({
    Key? key,
  }) : super(key: key);

  @override
  State<StoreSearch> createState() => _StoreSearchState();
}

class _StoreSearchState extends State<StoreSearch> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 10,
      ),
      decoration: BoxDecoration(
        color: StoreTheme.grey,
        borderRadius: BorderRadius.circular(10),
      ),
      // child: const SearchField(),
      child: CupertinoSearchTextField(
        backgroundColor: StoreTheme.grey,
        onChanged: (value) {
          setState(() {
            RentalItems.searchItems = RentalItems.searchItems.where((item) {
              return item.name.toLowerCase().contains(value.toLowerCase());
            }).toList();
          });
        },
      ),
    );
  }
}
