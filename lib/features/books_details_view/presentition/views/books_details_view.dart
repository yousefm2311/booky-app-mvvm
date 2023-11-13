import 'package:bookly_full_app_mvvm/core/utils/functions/navigator.dart';
import 'package:bookly_full_app_mvvm/core/utils/functions/url_launcher.dart';
import 'package:bookly_full_app_mvvm/core/utils/icon_broken.dart';
import 'package:bookly_full_app_mvvm/core/utils/styles.dart';
import 'package:bookly_full_app_mvvm/core/widgets/button.dart';
import 'package:bookly_full_app_mvvm/features/books_details_view/presentition/views/widgets/books_details_body_view.dart';
import 'package:bookly_full_app_mvvm/features/home/data/models/book_model/book_model.dart';
import 'package:flutter/material.dart';

class BooksDetailsView extends StatelessWidget {
  const BooksDetailsView({super.key, required this.bookModel});

  final BookModel bookModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Books Details',
          style: Styles.textStyle22.copyWith(color: Colors.black),
        ),
        backgroundColor: Colors.white,
        leading: IconButton(
            onPressed: () {
              popRouter(context);
            },
            icon: const Icon(
              IconBroken.Arrow___Left_2,
              color: Colors.black,
            )),
      ),
      body: BooksDetailsBodyView(bookModel: bookModel),
      bottomSheet: Padding(
        padding: const EdgeInsets.only(
            left: 20.0, right: 20.0, bottom: 10.0, top: 10.0),
        child: CustomButton(
          text: Text(
            'Review',
            style: Styles.textStyle20.copyWith(color: Colors.white),
          ),
          onPressed: () {
            launchCustomUrl(context, bookModel.volumeInfo.previewLink!);
          },
        ),
      ),
    );
  }
}
