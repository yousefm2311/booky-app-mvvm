import 'package:bookly_full_app_mvvm/core/utils/functions/navigator.dart';
import 'package:bookly_full_app_mvvm/core/utils/routes/routes.dart';
import 'package:bookly_full_app_mvvm/features/home/data/models/book_model/book_model.dart';
import 'package:bookly_full_app_mvvm/features/search/presentition/views/widget/search_list_view_item.dart';
import 'package:flutter/material.dart';

class SearchListView extends StatelessWidget {
  const SearchListView({super.key, required this.bookModel});

  final List<BookModel> bookModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0),
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        itemCount: bookModel.length,
        scrollDirection: Axis.vertical,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(
              bottom: 20.0,
            ),
            child: GestureDetector(
              onTap: () {
                pushRouter(AppRoutes.booksDetailsView, context,
                    extra: bookModel[index]);
              },
              child: SearchListViewItem(bookModel: bookModel[index]),
            ),
          );
        },
      ),
    );
  }
}
