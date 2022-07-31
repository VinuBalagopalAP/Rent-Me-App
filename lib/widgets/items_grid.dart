import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/items_provider.dart';

class ItemsGridView extends StatelessWidget {
  const ItemsGridView({super.key});

  @override
  Widget build(BuildContext context) {
    final items = Provider.of<RentalItems>(context);
    final rentalitems = items.getItems;

    return Expanded(
      child: GridView.builder(
        shrinkWrap: true,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 1.0,
          crossAxisSpacing: 10.0,
          mainAxisSpacing: 10.0,
        ),
        itemBuilder: (context, index) => GridTile(
          header: rentalitems[index],
        ),

        // children: RentalItems.searchItems
        //     .map(
        //       (e) => GestureDetector(
        //         onTap: () {
        //           Navigator.push(
        //             context,
        //             slidingRoute(ItemDetails(e)),
        //           );
        //         },
        //         child: GridTile(
        //           header: FavButton(
        //             e,
        //             onTap: () {
        //               e.updateFavourite();
        //               setState(() {});
        //             },
        //           ),
        //           child: Column(
        //             mainAxisSize: MainAxisSize.min,
        //             crossAxisAlignment: CrossAxisAlignment.start,
        //             children: [
        //               Expanded(
        //                 child: Container(
        //                   decoration: const BoxDecoration(
        //                     color: StoreTheme.whitish,
        //                   ),
        //                   child: Center(
        //                     child: Hero(
        //                       tag: "shoe-${e.name}",
        //                       child: Image(
        //                         image: AssetImage(
        //                           e.path,
        //                         ),
        //                         fit: BoxFit.fitWidth,
        //                       ),
        //                     ),
        //                   ),
        //                 ),
        //               ),
        //               const SizedBox(
        //                 height: 10,
        //               ),
        //               Padding(
        //                 padding: const EdgeInsets.symmetric(
        //                   horizontal: 10,
        //                   vertical: 5,
        //                 ),
        //                 child: Text(
        //                   e.name,
        //                 ),
        //               ),
        //               const SizedBox(
        //                 height: 5,
        //               ),
        //               Padding(
        //                 padding: const EdgeInsets.symmetric(
        //                   horizontal: 10,
        //                 ),
        //                 child: Text(
        //                   '\$${e.price}',
        //                   style: const TextStyle(
        //                     color: StoreTheme.primaryColor,
        //                   ),
        //                 ),
        //               ),
        //               const SizedBox(
        //                 height: 10,
        //               ),
        //             ],
        //           ),
        //         ),
        //       ),
        //     )
        //     .toList(),
      ),
    );
  }
}
