import 'package:flutter/material.dart';

/// [ Item ] is the model for the [ Item ] that is [ available for rent ]
class Item with ChangeNotifier {
  final String name;
  final String image;
  final double price;
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
    required this.name,
    required this.image,
    required this.price,
    this.rating = 0,
    this.days = const [39, 40, 42, 43, 44],
  });

  /// [ path ] is the getter for [ imagePath ]
  String get path => 'assets/items/$image';

  /// [ updateFavorite ] is the setter for [ isFavorite ]
  void updateFavourite() {
    isFavorite = !isFavorite;

    /// [ notifyListeners ] is used to notify the [ listeners ] of the [ changes ]
    notifyListeners();
  }
}
