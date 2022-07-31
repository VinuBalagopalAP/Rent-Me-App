import 'package:flutter/material.dart';

import '../models/item.dart';

class RentalItems with ChangeNotifier {
  /// [ _items ] is the list of items that are [ available for rent ]
  static final List<Item> _items = [
    Item(
      name: "Bike",
      image: "bike.png",
      description:
          'A bike is a bicycle with two wheels, one behind the other, which can be steered by the rider using a handlebar or by pedaling.',
      price: 28.50,
      rating: 3.8,
      isNewModel: false,
    ),
    Item(
      name: "Cycle",
      image: "cycle.png",
      description:
          'A cycle is a vehicle with two wheels, one behind the other, which can be steered by the rider using a handlebar or by pedaling.',
      price: 14.0,
      rating: 5,
      isNewModel: false,
    ),
    Item(
      name: "DJ Set",
      image: "djset.png",
      description: 'A DJ set is a set of equipment for a DJ.',
      price: 64.50,
      rating: 4.7,
      isNewModel: true,
    ),
    Item(
      name: " Mobile Beverage Set",
      image: "mbs.png",
      description:
          'A mobile beverage set is a set of equipment for a mobile beverage.',
      price: 32.70,
      rating: 4.9,
      isNewModel: true,
    ),
    Item(
      name: "Party Bus",
      image: "bus.png",
      description: 'A party bus is a vehicle for a party.',
      price: 99.99,
      rating: 4.9,
      isNewModel: true,
    ),
  ];

  bool _isAllModelsSelected = true;

  bool get getIsAllModelsSelected => _isAllModelsSelected;

  void toggleIsAllModelsSelected() {
    _isAllModelsSelected = !_isAllModelsSelected;
    notifyListeners();
  }

  /// [ getItems ] is the getter for [ items ]
  List<Item> get getItems => [..._items];

  static List<Item> searchItems = [..._items];

  /// [ searchItems ] is the getter for [ searchItems ]
  List<Item> get getSearchItems => [...searchItems];

  void search(String query) {
    searchItems = _items.where((item) {
      return item.name.toLowerCase().contains(query.toLowerCase());
    }).toList();

    notifyListeners();
  }
}
