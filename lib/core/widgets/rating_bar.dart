import 'package:bookly_full_app_mvvm/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class RatingBar extends StatelessWidget {
  const RatingBar({super.key, required this.rating, required this.text});

  final num rating;
  final num text;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        RatingBarIndicator(
          rating: rating.toDouble(),
          itemBuilder: (context, index) => const Icon(
            Icons.star_rounded,
            color: Colors.orange,
          ),
          itemCount: 5,
          itemSize: 23.0,
          direction: Axis.horizontal,
        ),
        const SizedBox(width: 15.0),
        Text(text.toString(),
            style: Styles.textStyle16
                .copyWith(fontWeight: FontWeight.bold, color: Colors.black))
      ],
    );
  }
}
