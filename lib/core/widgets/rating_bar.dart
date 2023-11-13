import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class RatingBar extends StatelessWidget {
  const RatingBar({super.key, required this.rating});

  final double rating;

  @override
  Widget build(BuildContext context) {
    return RatingBarIndicator(
      rating: rating,
      itemBuilder: (context, index) => const Icon(
        Icons.star_rounded,
        color: Colors.amber,
      ),
      itemCount: 5,
      itemSize: 23.0,
      direction: Axis.horizontal,
    );
  }
}
