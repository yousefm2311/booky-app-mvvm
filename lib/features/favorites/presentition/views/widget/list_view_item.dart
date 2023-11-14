import 'package:bookly_full_app_mvvm/core/utils/icon_broken.dart';
import 'package:bookly_full_app_mvvm/core/utils/services/firestore_services.dart';
import 'package:bookly_full_app_mvvm/core/utils/styles.dart';
import 'package:bookly_full_app_mvvm/core/widgets/custom_image.dart';
import 'package:bookly_full_app_mvvm/core/widgets/rating_bar.dart';
import 'package:bookly_full_app_mvvm/features/favorites/data/models/favorites_model.dart';
import 'package:bookly_full_app_mvvm/features/favorites/presentition/view_model/favorite_bloc/favorite_bloc.dart';
import 'package:bookly_full_app_mvvm/features/favorites/presentition/view_model/favorite_bloc/favorite_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ListViewItems extends StatelessWidget {
  const ListViewItems({super.key, required this.favoritesModel});
  final FavoritesModel favoritesModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: SizedBox(
        height: 120,
        child: Row(
          children: [
            CustomImageView(imageUrl: favoritesModel.image!, aspectRatio: 1),
            SizedBox(
              width: MediaQuery.sizeOf(context).width * .55,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    favoritesModel.title!,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: Styles.textStyle22.copyWith(color: Colors.black),
                  ),
                  const SizedBox(height: 10),
                  Text(favoritesModel.author!,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: Styles.textStyle16.copyWith(
                          color: Colors.black54, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      RatingBar(
                          rating: favoritesModel.averageRating!,
                          text: favoritesModel.averageRating!),
                      const Spacer(),
                      GestureDetector(
                        onTap: () {
                          FireStoreUser().removeFavoritesDataFromFirebase(
                              favoritesModel.id);
                          BlocProvider.of<FavoriteBloc>(context)
                              .add(FetchFavoriteDataEvent());
                        },
                        child: const Icon(IconBroken.Delete),
                      )
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
