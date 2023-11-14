import 'package:bookly_full_app_mvvm/core/utils/assets.dart';
import 'package:bookly_full_app_mvvm/core/utils/styles.dart';
import 'package:bookly_full_app_mvvm/core/widgets/custom_image.dart';
import 'package:bookly_full_app_mvvm/features/home/data/models/book_model/book_model.dart';
import 'package:flutter/material.dart';

class SectionImageText extends StatelessWidget {
  const SectionImageText({super.key, required this.bookModel});

  final BookModel bookModel;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 20.0),
        Align(
            alignment: AlignmentDirectional.center,
            child: SizedBox(
                height: MediaQuery.sizeOf(context).height * .3,
                child: CustomImageView(
                    imageUrl: bookModel.volumeInfo.imageLinks?.thumbnail ??
                        AssetsData.errorImage,
                    aspectRatio: 5 / 7))),
        const SizedBox(height: 20.0),
        Text(bookModel.volumeInfo.title.toString(),
            style: Styles.textStyle22.copyWith(color: Colors.black),
            maxLines: 3,
            overflow: TextOverflow.ellipsis),
        const SizedBox(height: 10.0),
        Text(
          bookModel.volumeInfo.authors?.first ??
              'No Author available for this book',
          style: Styles.textStyle16
              .copyWith(color: Colors.black54, fontWeight: FontWeight.w800),
        ),
        const SizedBox(height: 10.0),
      ],
    );
  }
}
