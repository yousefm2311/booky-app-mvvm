import 'package:bookly_full_app_mvvm/core/utils/styles.dart';
import 'package:bookly_full_app_mvvm/core/widgets/custom_image.dart';
import 'package:bookly_full_app_mvvm/core/widgets/rating_bar.dart';
import 'package:flutter/material.dart';

class GridViewItems extends StatelessWidget {
  const GridViewItems({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const CustomImageView(
          imageUrl: '',
          aspectRatio: 4.5 / 5.5,
        ),
        const SizedBox(height: 10.0),
        Padding(
          padding: const EdgeInsets.only(right: 10, left: 2),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('The Swallows A Novel',
                  style: Styles.textStyle16
                      .copyWith(fontWeight: FontWeight.bold, fontSize: 15),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis),
              const SizedBox(height: 3.0),
              Text('by Lisa Lutz',
                  style:
                      Styles.textStyle14.copyWith(fontWeight: FontWeight.bold)),
              SizedBox(
                height: 25.0,
                child: Row(
                  children: [
                    const RatingBar(rating: 2.7),
                    const SizedBox(width: 15.0),
                    Text('2.7',
                        style: Styles.textStyle14.copyWith(
                            fontWeight: FontWeight.bold, color: Colors.black))
                  ],
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}
