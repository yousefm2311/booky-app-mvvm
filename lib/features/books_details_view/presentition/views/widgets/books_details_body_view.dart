import 'package:bookly_full_app_mvvm/core/utils/styles.dart';
import 'package:bookly_full_app_mvvm/core/widgets/custom_image.dart';
import 'package:bookly_full_app_mvvm/core/widgets/rating_bar.dart';
import 'package:bookly_full_app_mvvm/features/home/data/models/book_model/book_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';

class BooksDetailsBodyView extends StatelessWidget {
  const BooksDetailsBodyView({super.key, required this.bookModel});
  final BookModel bookModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20.0, right: 20.0, bottom: 30.0),
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20.0),
            Align(
                alignment: AlignmentDirectional.center,
                child: SizedBox(
                    height: MediaQuery.sizeOf(context).height * .3,
                    child: CustomImageView(
                        imageUrl: bookModel.volumeInfo.imageLinks!.thumbnail,
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
            Row(
              children: [
                RatingBar(
                    rating: bookModel.volumeInfo.averageRating?.round() ?? 0.0,
                    text: bookModel.volumeInfo.averageRating?.round() ?? 0.0),
                const Spacer(),
                GestureDetector(
                  onTap: () async {
                    await Share.share(
                      bookModel.volumeInfo.previewLink!
                          .toString()
                          .replaceFirst(':', ''),
                      sharePositionOrigin: Rect.fromPoints(
                          const Offset(2, 2), const Offset(3, 3)),
                    );
                  },
                  child: const Icon(CupertinoIcons.share),
                )
              ],
            ),
            const SizedBox(height: 20.0),
            Text(
                bookModel.volumeInfo.description ??
                    'No description available for this book',
                textAlign: TextAlign.justify,
                style: Styles.textStyle16.copyWith(
                    color: Colors.black54, fontWeight: FontWeight.w800)),
            const SizedBox(height: 50.0),
          ],
        ),
      ),
    );
  }
}
