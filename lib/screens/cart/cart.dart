import 'package:flutter/material.dart';

class CartScreen extends StatelessWidget {
  static const routeName = '/auth';

  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: const [
          Text('No items added to the cart yet.'),
        ],
      ),
    );
  }
}
