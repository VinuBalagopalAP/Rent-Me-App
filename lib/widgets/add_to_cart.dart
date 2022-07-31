import 'package:flutter/material.dart';
import '../utils/theme.dart';

class AddToCart extends StatelessWidget {
  const AddToCart({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 150,
      child: TextButton.icon(
        onPressed: () {},
        icon: const Icon(Icons.shopping_cart),
        label: const Text("Add to Cart"),
        style: ButtonStyle(
          shape: MaterialStateProperty.resolveWith(
            (states) => RoundedRectangleBorder(
              side: const BorderSide(color: StoreTheme.grey),
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          padding: MaterialStateProperty.resolveWith(
            (states) => const EdgeInsets.all(12),
          ),
        ),
      ),
    );
  }
}
