import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../models/product/item.dart';
import '../../../../utils/slide.dart';
import '../../../../utils/theme.dart';
import '../../../details/details.dart';

class GridItem extends StatelessWidget {
  const GridItem({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Item e = Provider.of<Item>(context, listen: false);
    
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          slidingRoute(ItemDetails(e)),
        );
      },
      child: GridTile(
        header: Container(
          alignment: Alignment.centerLeft,
          child: Consumer<Item>(
            builder: (context, item, _) => TextButton(
              onPressed: item.updateFavourite,
              style: ButtonStyle(
                shape: MaterialStateProperty.resolveWith(
                  (states) => const CircleBorder(),
                ),
                backgroundColor: MaterialStateProperty.resolveWith(
                  (states) => StoreTheme.grey,
                ),
              ),
              child: Icon(
                Icons.favorite,
                color: item.isFavorite
                    ? StoreTheme.primaryColor
                    : StoreTheme.black,
              ),
            ),
          ),
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
    );
  }
}
