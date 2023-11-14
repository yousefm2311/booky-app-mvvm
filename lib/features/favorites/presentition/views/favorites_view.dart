import 'package:bookly_full_app_mvvm/core/utils/services/services_locator.dart';
import 'package:bookly_full_app_mvvm/features/favorites/data/repos/favorite_repo_impl.dart';
import 'package:bookly_full_app_mvvm/features/favorites/presentition/view_model/favorite_bloc/favorite_bloc.dart';
import 'package:bookly_full_app_mvvm/features/favorites/presentition/view_model/favorite_bloc/favorite_event.dart';
import 'package:bookly_full_app_mvvm/features/favorites/presentition/views/widget/favorites_body_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavoritesView extends StatelessWidget {
  const FavoritesView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => FavoriteBloc(getIt.get<FavoriteRepoImpl>())
        ..add(FetchFavoriteDataEvent()),
      child: const FavoritesBodyView(),
    );
  }
}
