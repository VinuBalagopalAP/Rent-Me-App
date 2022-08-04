import 'package:flutter/material.dart';

import '../../models/product/item.dart';

class RentalItems with ChangeNotifier {
  /// [ _items ] is the list of items that are [ available for rent ]
  static final List<Item> _items = [
    Item(
      id: 1,
      name: "Bike",
      image: "bike.png",
      description:
          'A bike is a bicycle with two wheels, one behind the other, which can be steered by the rider using a handlebar or by pedaling.',
      price: 28.50,
      rating: 3.8,
      isNewModel: false,
    ),
    Item(
      id: 2,
      name: "Cycle",
      image: "cycle.png",
      description:
          'A cycle is a vehicle with two wheels, one behind the other, which can be steered by the rider using a handlebar or by pedaling.',
      price: 14.0,
      rating: 5,
      isNewModel: false,
    ),
    Item(
      id: 3,
      name: "DJ Set",
      image: "djset.png",
      description: 'A DJ set is a set of equipment for a DJ.',
      price: 64.50,
      rating: 4.7,
      isNewModel: true,
    ),
    Item(
      id: 4,
      name: " Mobile Beverage Set",
      image: "mbs.png",
      description:
          'A mobile beverage set is a set of equipment for a mobile beverage.',
      price: 32.70,
      rating: 4.9,
      isNewModel: true,
    ),
    Item(
      id: 5,
      name: "Party Bus",
      image: "bus.png",
      description: 'A party bus is a vehicle for a party.',
      price: 99.99,
      rating: 4.9,
      isNewModel: true,
    ),
  ];

  /// [ getID ] is the getter for [ id ]
  List<Item> get getID => [..._items];

  /// [ _isAllModelsSelected ] is the flag to check if all models are selected
  bool _isAllModelsSelected = true;

  /// [ getIsAllModelsSelected ] is the getter for [ _isAllModelsSelected ]
  bool get getIsAllModelsSelected => _isAllModelsSelected;

  /// [ toggleIsAllModelsSelected ] is the setter for [ _isAllModelsSelected ]
  void toggleIsAllModelsSelected() {
    _isAllModelsSelected = !_isAllModelsSelected;
    notifyListeners();
  }

  /// [ getItems ] is the getter for [ items ]
  List<Item> get getItems => [..._items];

  /// [ searchItems ] is the list of items that are [ available for rent ] which need to be searched
  static List<Item> searchItems = [..._items];

  /// [ searchItems ] is the getter for [ searchItems ]
  List<Item> get getSearchItems => [...searchItems];

  /// [ getNewModels ] is the list of items that are [ fetched while search happens ]
  List<Item> get getNewModels {
    return _items.where((element) => element.isNewModel == true).toList();
  }

  /// [ search ] is the function to search for [ items ]
  void search(String query) {
    searchItems.clear();
    _items.where((item) {
      debugPrint(item.name.toLowerCase());
      debugPrint(query.toLowerCase());
      debugPrint(
          item.name.toLowerCase().contains(query.toLowerCase()).toString());
      if (item.name.toLowerCase().contains(query.toLowerCase())) {
        searchItems.add(item);
        notifyListeners();
      }
      return item.name.toLowerCase().contains(query.toLowerCase());
    }).toList();
    for (var item in searchItems) {
      debugPrint(item.name);
    }
  }
}
