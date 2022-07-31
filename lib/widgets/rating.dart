import 'package:flutter/material.dart';

class Rating extends StatelessWidget {
  final double rating;
  const Rating({
    Key? key,
    required this.rating,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        for (int i = 0; i < 5; i++) ...[
          Icon(
            rating.floor() > i ? Icons.star : Icons.star_outline,
            color: rating.floor() > i ? Colors.amber : Colors.grey,
            size: 18,
          ),
        ],
        const SizedBox(
          width: 10,
        ),
        Text(
          '($rating)',
          style: const TextStyle(),
        ),
        const SizedBox(
          width: 10,
        ),
      ],
    );
  }
}
