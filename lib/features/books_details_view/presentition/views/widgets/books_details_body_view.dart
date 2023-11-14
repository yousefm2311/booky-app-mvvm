import 'package:bookly_full_app_mvvm/core/utils/styles.dart';
import 'package:bookly_full_app_mvvm/features/books_details_view/presentition/views/widgets/section_image_text.dart';
import 'package:bookly_full_app_mvvm/features/books_details_view/presentition/views/widgets/section_rating.dart';
import 'package:bookly_full_app_mvvm/features/home/data/models/book_model/book_model.dart';
import 'package:flutter/material.dart';
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
            SectionImageText(bookModel: bookModel),
            SectionRating(bookModel: bookModel),
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
