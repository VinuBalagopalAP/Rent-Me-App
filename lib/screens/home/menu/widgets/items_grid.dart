import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../menu/widgets/grid_item.dart';
import '../../../../provider/product/items_provider.dart';

class ItemsGridView extends StatelessWidget {
  const ItemsGridView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final items = Provider.of<RentalItems>(context);

    return items.getIsAllModelsSelected
        ? Expanded(
            child: Consumer<RentalItems>(
              builder: (context, value, _) => GridView.builder(
                shrinkWrap: true,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 1.0,
                  crossAxisSpacing: 10.0,
                  mainAxisSpacing: 10.0,
                ),
                itemCount: value.getSearchItems.length,
                itemBuilder: (context, index) => ChangeNotifierProvider.value(
                  value: value.getSearchItems[index],
                  child: const GridItem(),
                ),
              ),
            ),
          )
        : Consumer<RentalItems>(
            builder: (context, value, _) => GridView.builder(
              shrinkWrap: true,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 1.0,
                crossAxisSpacing: 10.0,
                mainAxisSpacing: 10.0,
              ),
              itemCount: value.getNewModels.length,
              itemBuilder: (context, index) => ChangeNotifierProvider.value(
                value: value.getNewModels[index],
                child: const GridItem(),
              ),
            ),
          );
  }
}
