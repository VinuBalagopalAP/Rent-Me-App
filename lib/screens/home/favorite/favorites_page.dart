import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../provider/providers.dart';
import '../menu/widgets/grid_item.dart';

class Favorites extends StatefulWidget {
  const Favorites({Key? key}) : super(key: key);

  @override
  State<Favorites> createState() => _FavoritesState();
}

class _FavoritesState extends State<Favorites> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text(
          'Favorites',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Consumer<RentalItems>(
          builder: (context, value, _) => GridView.builder(
            shrinkWrap: true,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 1.0,
              crossAxisSpacing: 10.0,
              mainAxisSpacing: 10.0,
            ),
            itemCount: value.getFavoriteModels.length,
            itemBuilder: (context, index) => ChangeNotifierProvider.value(
              value: value.getFavoriteModels[index],
              child: const GridItem(),
            ),
          ),
        ),
      ],
    );
  }
}
