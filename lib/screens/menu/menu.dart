import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../provider/items_provider.dart';
import '../../widgets/items_grid.dart';
import '../../widgets/search.dart';

class Menu extends StatefulWidget {
  const Menu({Key? key}) : super(key: key);

  @override
  State<Menu> createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  List<bool> isSelected = [
    true,
    false,
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
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
            ],
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        const ItemsGridView(),
      ],
    );
  }
}
