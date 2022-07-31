import 'package:flutter/material.dart';

import '../models/item.dart';

class RentalItems with ChangeNotifier {
  /// [ _items ] is the list of items that are [ available for rent ]
  static final List<Item> _items = [
    Item(
      name: "Bike",
      image: "bike.png",
      price: 28.50,
      rating: 3.8,
      isNewModel: false,
    ),
    Item(
      name: "Cycle",
      image: "cycle.png",
      price: 14.0,
      rating: 5,
      isNewModel: false,
    ),
    Item(
      name: "DJ Set",
      image: "djset.png",
      price: 64.50,
      rating: 4.7,
      isNewModel: true,
    ),
    Item(
      name: " Mobile Beverage Set",
      image: "mbs.png",
      price: 32.70,
      rating: 4.9,
      isNewModel: true,
    ),
    Item(
      name: "Party Bus",
      image: "bus.png",
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
