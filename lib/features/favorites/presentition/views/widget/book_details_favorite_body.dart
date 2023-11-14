
import 'package:bookly_full_app_mvvm/core/utils/styles.dart';
import 'package:bookly_full_app_mvvm/features/favorites/data/models/favorites_model.dart';
import 'package:bookly_full_app_mvvm/features/favorites/presentition/views/widget/section_image_favorite.dart';
import 'package:bookly_full_app_mvvm/features/favorites/presentition/views/widget/section_rating_favorite.dart';
import 'package:flutter/material.dart';
class BooksDetailsFavoriteBodyView extends StatelessWidget {
  const BooksDetailsFavoriteBodyView({super.key, required this.favoritesModel});
  final FavoritesModel  favoritesModel;


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20.0, right: 20.0, bottom: 30.0),
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SectionImageFavorite(favoritesModel: favoritesModel),
            SectionRatingFavorite(favoritesModel: favoritesModel),
            const SizedBox(height: 20.0),
            Text(
                favoritesModel.description!,
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
