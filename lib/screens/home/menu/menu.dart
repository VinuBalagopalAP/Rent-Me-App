import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../provider/product/items_provider.dart';
import 'widgets/items_grid.dart';

class Menu extends StatefulWidget {
  static const routeName = '/menu';

  const Menu({Key? key}) : super(key: key);

  @override
  State<Menu> createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  /// [ isSelected ] is a [ bool ] which is used to display the selected items.
  List<bool> isSelected = [
    true,
    false,
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),

          /// [ ToggleButtons ] is a [ ToggleButtons ] which is used to select the items.
          child: ToggleButtons(
            borderRadius: BorderRadius.circular(8.0),
            isSelected: isSelected,
            onPressed: ((_) {
              /// [ toggleIsAllModelSelected ] is a [ Function ] which is used to toggle the selected items with using [ RentalItems ] via [ Provider ].
              Provider.of<RentalItems>(context, listen: false)
                  .toggleIsAllModelsSelected();

              /// [ setState ] is used to update the [ isSelected ] list.
              setState(() {
                isSelected[0] = !isSelected[0];
                isSelected[1] = !isSelected[1];
              });
            }),

            /// [ children ] is a [ List ] which is used to display the selected items.
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

        /// [ ItemsGridView ] is a [ ItemsGridView ] which is used to display the items.
        const ItemsGridView(),
      ],
    );
  }
}
