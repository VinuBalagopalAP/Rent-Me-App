import 'dart:developer';

import 'package:flutter/material.dart';

/// [ Item ] is the model for the [ Item ] that is [ available for rent ]
class Item with ChangeNotifier {
  final int id;
  final String name;
  final String image;
  final String description;
  final double price;
  final bool isNewModel;
  bool isFavorite = false;

  final double rating;
  final List<int> days;
  List<Color> colors = [
    const Color(0xFFBBDC81),
    const Color(0xFFFE5A59),
    Colors.black,
    const Color(0xFFFF6BE9),
  ];

  Item({
    required this.id,
    required this.name,
    required this.image,
    required this.description,
    required this.price,
    required this.isNewModel,
    this.rating = 0,
    this.days = const [1, 2, 5, 10, 30],
  });

  /// [ path ] is the getter for [ imagePath ]
  String get path => 'assets/items/$image';

  /// [ updateFavorite ] is the setter for [ isFavorite ]
  void updateFavourite() {
    isFavorite = !isFavorite;
    log('hello');

    /// [ notifyListeners ] is used to notify the [ listeners ] of the [ changes ]
    notifyListeners();
  }
}
