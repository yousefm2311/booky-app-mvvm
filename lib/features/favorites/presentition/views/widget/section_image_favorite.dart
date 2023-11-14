import 'package:bookly_full_app_mvvm/core/utils/styles.dart';
import 'package:bookly_full_app_mvvm/core/widgets/custom_image.dart';
import 'package:bookly_full_app_mvvm/features/favorites/data/models/favorites_model.dart';
import 'package:flutter/material.dart';

class SectionImageFavorite extends StatelessWidget {
  const SectionImageFavorite({super.key, required this.favoritesModel});

  final FavoritesModel favoritesModel;

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
                    imageUrl: favoritesModel.image!,
                    aspectRatio: 5 / 7))),
        const SizedBox(height: 20.0),
        Text(favoritesModel.title.toString(),
            style: Styles.textStyle22.copyWith(color: Colors.black),
            maxLines: 3,
            overflow: TextOverflow.ellipsis),
        const SizedBox(height: 10.0),
        Text(
          favoritesModel.author !,
          style: Styles.textStyle16
              .copyWith(color: Colors.black54, fontWeight: FontWeight.w800),
        ),
        const SizedBox(height: 10.0),
      ],
    );
  }
}
