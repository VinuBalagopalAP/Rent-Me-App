import 'dart:math';

import 'package:flutter/material.dart';
import 'package:rent_me/models/item.dart';

import '../../utils/theme.dart';
import '../../widgets/add_to_cart.dart';
import '../../widgets/buy_now.dart';
import '../../widgets/fav_button.dart';
import '../../widgets/rating.dart';
import '../../widgets/selection_button.dart';

class ItemDetails extends StatefulWidget {
  final Item item;
  const ItemDetails(
    this.item, {
    Key? key,
  }) : super(key: key);

  @override
  State<ItemDetails> createState() => _ItemDetailsState();
}

class _ItemDetailsState extends State<ItemDetails> {
  int _selectedDays = 39;

  void updateSelectedSize(int size) {
    setState(() {
      _selectedDays = size;
    });
  }

  late Color _selectedColor;

  void updateSelectedColor(Color color) {
    setState(() {
      _selectedColor = color;
    });
  }

  @override
  void initState() {
    _selectedColor =
        widget.item.colors[Random().nextInt(widget.item.colors.length)];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: ListView(
            children: [
              AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                width: MediaQuery.of(context).size.width,
                height: 250,
                decoration: BoxDecoration(
                  color: _selectedColor,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Stack(
                  children: [
                    Positioned.fill(
                      child: Center(
                        child: Hero(
                          tag: "item-${widget.item.name}",
                          child: Image.asset(
                            widget.item.path,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 10,
                      right: 10,
                      child: FavButton(
                        widget.item.isFavorite,
                        onTap: () {
                          widget.item.updateFavourite();
                          setState(() {});
                        },
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                widget.item.name,
                style: const TextStyle(
                  fontSize: 22,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Rating(rating: widget.item.rating),
              const SizedBox(
                height: 20,
              ),
              Text(
                "\$${widget.item.price}",
                style: const TextStyle(
                  fontSize: 25,
                  color: StoreTheme.primaryColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const Text("Sizes"),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: widget.item.days
                    .map(
                      (e) => SelectionButton<int>(
                        value: e,
                        selectedValue: _selectedDays,
                        updateValue: updateSelectedSize,
                      ),
                    )
                    .toList(),
              ),
              const SizedBox(
                height: 20,
              ),
              const Text("Colors"),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: widget.item.colors
                    .map(
                      (e) => SelectionButton<Color>(
                        value: e,
                        selectedValue: _selectedColor,
                        updateValue: updateSelectedColor,
                      ),
                    )
                    .toList(),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: const [
                  AddToCart(),
                  BuyNow(),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
