import 'package:bookly_full_app_mvvm/core/utils/colors.dart';
import 'package:bookly_full_app_mvvm/core/utils/functions/custom_snack_bar.dart';
import 'package:bookly_full_app_mvvm/core/utils/icon_broken.dart';
import 'package:bookly_full_app_mvvm/core/utils/services/services_locator.dart';
import 'package:bookly_full_app_mvvm/core/widgets/rating_bar.dart';
import 'package:bookly_full_app_mvvm/features/books_details_view/data/repos/books_details_repo_impl.dart';
import 'package:bookly_full_app_mvvm/features/books_details_view/presentition/view_model/books_details_bloc/books_details_bloc.dart';
import 'package:bookly_full_app_mvvm/features/books_details_view/presentition/view_model/books_details_bloc/books_details_event.dart';
import 'package:bookly_full_app_mvvm/features/books_details_view/presentition/view_model/books_details_bloc/books_details_state.dart';
import 'package:bookly_full_app_mvvm/features/home/data/models/book_model/book_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:share_plus/share_plus.dart';

class SectionRating extends StatelessWidget {
  const SectionRating(
      {super.key, required this.bookModel,});

  final BookModel bookModel;


  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => BookDetailsBloc(getIt.get<BooksDetailsRepoImpl>()),
        child: BlocConsumer<BookDetailsBloc, BookDetailsState>(
          builder: (context, state) {
            return Row(
              children: [
                RatingBar(
                    rating: bookModel.volumeInfo.averageRating?.round() ?? 0.0,
                    text: bookModel.volumeInfo.averageRating?.round() ?? 0.0),
                const Spacer(),
                GestureDetector(
                  onTap: () async {
                    BlocProvider.of<BookDetailsBloc>(context)
                        .add(AddBookDetailsFavoriteEvent(bookModel: bookModel));
                  },
                  child: Container(
                    padding: const EdgeInsets.all(4),
                    decoration: BoxDecoration(
                        color: AppColors.kGreyColor,
                        borderRadius: BorderRadius.circular(20)),
                    child:  const Icon(IconBroken.Heart),
                  ),
                ),
                const SizedBox(width: 5.0),
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
            );
          },
          listener: (context, state) {
            if (state is AddBookDetailsFavoriteSuccessState) {
              customSnackBar(context, text: 'add book details to favorites');
            } else if (state is AddBookDetailsFavoriteFailuireState) {
              customSnackBar(context, text: state.errorMessage.toString());
            }
          },
        ));
  }
}
