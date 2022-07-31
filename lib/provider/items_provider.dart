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
    ),
    Item(
      name: "Cycle",
      image: "cycle.png",
      price: 14.0,
      rating: 5,
    ),
    Item(
      name: "DJ Set",
      image: "djset.png",
      price: 64.50,
      rating: 4.7,
    ),
    Item(
      name: " Mobile Beverage Set",
      image: "mbs.png",
      price: 32.70,
      rating: 4.9,
    ),
    Item(
      name: "Party Bus",
      image: "bus.png",
      price: 99.99,
      rating: 4.9,
    ),
  ];

  /// [ getItems ] is the getter for [ items ]
  List<Item> get getItems => [..._items];

  static List<Item> searchItems = [];

  /// [ searchItems ] is the getter for [ searchItems ]
  List<Item> get getSearchItems => [...searchItems];
}
