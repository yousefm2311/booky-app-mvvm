import 'package:bookly_full_app_mvvm/core/utils/assets.dart';
import 'package:bookly_full_app_mvvm/core/utils/styles.dart';
import 'package:bookly_full_app_mvvm/core/widgets/custom_image.dart';
import 'package:bookly_full_app_mvvm/core/widgets/rating_bar.dart';
import 'package:bookly_full_app_mvvm/features/home/data/models/book_model/book_model.dart';
import 'package:flutter/material.dart';

class GridViewItems extends StatelessWidget {
  const GridViewItems({super.key, required this.bookModel});
  final BookModel bookModel;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomImageView(
          imageUrl: bookModel.volumeInfo.imageLinks?.thumbnail ??
              AssetsData.errorImage,
          aspectRatio: 1,
        ),
        const SizedBox(height: 10.0),
        Padding(
          padding: const EdgeInsets.only(right: 10, left: 2),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(bookModel.volumeInfo.title.toString(),
                  style: Styles.textStyle16
                      .copyWith(fontWeight: FontWeight.bold, fontSize: 15),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis),
              const SizedBox(height: 3.0),
              Text(bookModel.volumeInfo.authors?.first ?? '',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style:
                      Styles.textStyle14.copyWith(fontWeight: FontWeight.bold)),
              SizedBox(
                height: 25.0,
                child: Row(
                  children: [
                    RatingBar(
                        rating:
                            bookModel.volumeInfo.averageRating?.round() ?? 0.0,
                        text:
                            bookModel.volumeInfo.averageRating?.round() ?? 0.0),
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
