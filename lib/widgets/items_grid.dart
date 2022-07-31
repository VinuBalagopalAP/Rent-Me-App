import 'package:flutter/material.dart';
import '../config/data.dart';
import '../screens/details/details.dart';
import '../utils/slide.dart';
import '../utils/theme.dart';
import '../widgets/fav_button.dart';

class ItemsGridView extends StatefulWidget {
  const ItemsGridView({
    Key? key,
  }) : super(key: key);

  @override
  State<ItemsGridView> createState() => _ItemsGridViewState();
}

class _ItemsGridViewState extends State<ItemsGridView> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GridView.count(
        shrinkWrap: true,
        crossAxisCount: 2,
        children: RentalItems.searchItems
            .map(
              (e) => GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    slidingRoute(ItemDetails(e)),
                  );
                },
                child: GridTile(
                  header: FavButton(
                    e,
                    onTap: () {
                      e.updateFavourite();
                      setState(() {});
                    },
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Container(
                          decoration: const BoxDecoration(
                            color: StoreTheme.whitish,
                          ),
                          child: Center(
                            child: Hero(
                              tag: "shoe-${e.name}",
                              child: Image(
                                image: AssetImage(
                                  e.path,
                                ),
                                fit: BoxFit.fitWidth,
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 5,
                        ),
                        child: Text(
                          e.name,
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10,
                        ),
                        child: Text(
                          '\$${e.price}',
                          style: const TextStyle(
                            color: StoreTheme.primaryColor,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
                ),
              ),
            )
            .toList(),
      ),
    );
  }
}
