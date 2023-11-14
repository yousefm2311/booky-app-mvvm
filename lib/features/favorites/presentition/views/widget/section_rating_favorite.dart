import 'package:bookly_full_app_mvvm/core/utils/functions/custom_snack_bar.dart';
import 'package:bookly_full_app_mvvm/core/utils/services/services_locator.dart';
import 'package:bookly_full_app_mvvm/core/widgets/rating_bar.dart';
import 'package:bookly_full_app_mvvm/features/books_details_view/data/repos/books_details_repo_impl.dart';
import 'package:bookly_full_app_mvvm/features/books_details_view/presentition/view_model/books_details_bloc/books_details_bloc.dart';
import 'package:bookly_full_app_mvvm/features/books_details_view/presentition/view_model/books_details_bloc/books_details_state.dart';
import 'package:bookly_full_app_mvvm/features/favorites/data/models/favorites_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:share_plus/share_plus.dart';

class SectionRatingFavorite extends StatelessWidget {
  const SectionRatingFavorite({
    super.key,
    required this.favoritesModel,
  });

  final FavoritesModel favoritesModel;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => BookDetailsBloc(getIt.get<BooksDetailsRepoImpl>()),
        child: BlocConsumer<BookDetailsBloc, BookDetailsState>(
          builder: (context, state) {
            return Row(
              children: [
                RatingBar(
                    rating: favoritesModel.averageRating!,
                    text: favoritesModel.averageRating!),
                const Spacer(),
                GestureDetector(
                  onTap: () async {
                    await Share.share(
                      favoritesModel.review.toString(),
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
