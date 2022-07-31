import 'package:flutter/material.dart';
import '../utils/theme.dart';

class FavButton extends StatefulWidget {
  final VoidCallback? onTap;
  final bool isFav;

  const FavButton(this.isFav, {Key? key, this.onTap}) : super(key: key);

  @override
  State<FavButton> createState() => _FavButtonState();
}

class _FavButtonState extends State<FavButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      child: TextButton(
        onPressed: widget.onTap,
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
          color: widget.isFav ? StoreTheme.primaryColor : StoreTheme.black,
        ),
      ),
    );
  }
}
