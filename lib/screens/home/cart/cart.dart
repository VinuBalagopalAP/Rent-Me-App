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
        children: [
          const Text(
            'Cart',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Image.network(
            'https://img.freepik.com/premium-vector/shopping-cart-with-gift-boxes-shopping-bags-presents-with-bow-ribbon-e-shop-blue_249405-59.jpg?w=1800',
            height: 250.0,
          ),
          const SizedBox(
            height: 20,
          ),
          const Text('No items added to the cart yet.'),
        ],
      ),
    );
  }
}
