import 'package:bookly_full_app_mvvm/core/utils/assets.dart';
import 'package:bookly_full_app_mvvm/core/utils/styles.dart';
import 'package:bookly_full_app_mvvm/core/widgets/custom_image.dart';
import 'package:bookly_full_app_mvvm/core/widgets/rating_bar.dart';
import 'package:bookly_full_app_mvvm/features/home/data/models/book_model/book_model.dart';
import 'package:flutter/material.dart';

class SearchListViewItem extends StatelessWidget {
  const SearchListViewItem({super.key, required this.bookModel});

  final BookModel bookModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Row(
        children: [
          SizedBox(
            height: 130.0,
            width: 100.0,
            child: CustomImageView(
                imageUrl: bookModel.volumeInfo.imageLinks?.thumbnail ?? AssetsData.errorImage,
                aspectRatio: 4 / 3),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: MediaQuery.sizeOf(context).width * .59,
                child: Text(
                  bookModel.volumeInfo.title!,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: Styles.textStyle22.copyWith(color: Colors.black),
                ),
              ),
              const SizedBox(height: 10.0),
              SizedBox(
                width: MediaQuery.sizeOf(context).width * .54,
                child: Text(
                  bookModel.volumeInfo.authors?[0] ?? 'No authors available',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: Styles.textStyle16.copyWith(color: Colors.black),
                ),
              ),
              RatingBar(
                  rating: bookModel.volumeInfo.averageRating ?? 0.0,
                  text: bookModel.volumeInfo.averageRating ?? 0.0)
            ],
          )
        ],
      ),
    );
  }
}
