import 'package:flutter/material.dart';
import '../models/item.dart';
import '../utils/theme.dart';

class FavButton extends StatelessWidget {
  final VoidCallback? onTap;
  final Item shoe;

  const FavButton(this.shoe, {Key? key, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      child: TextButton(
        onPressed: onTap,
        style: ButtonStyle(
          shape: MaterialStateProperty.resolveWith(
            (states) => const CircleBorder(),
          ),
          backgroundColor: MaterialStateProperty.resolveWith(
            (states) => StoreTheme.grey,
          ),
        ),
        child: Icon(
          Icons.favorite,
          color: shoe.isFavorite ? StoreTheme.primaryColor : StoreTheme.black,
        ),
      ),
    );
  }
}
