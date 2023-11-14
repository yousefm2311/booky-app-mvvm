import 'package:bookly_full_app_mvvm/core/utils/functions/navigator.dart';
import 'package:bookly_full_app_mvvm/core/utils/routes/routes.dart';
import 'package:bookly_full_app_mvvm/core/widgets/custom_error_widget.dart';
import 'package:bookly_full_app_mvvm/core/widgets/custom_loading_indicator.dart';
import 'package:bookly_full_app_mvvm/core/widgets/error_widget.dart';
import 'package:bookly_full_app_mvvm/features/favorites/presentition/view_model/favorite_bloc/favorite_bloc.dart';
import 'package:bookly_full_app_mvvm/features/favorites/presentition/view_model/favorite_bloc/favorite_state.dart';
import 'package:bookly_full_app_mvvm/features/favorites/presentition/views/widget/list_view_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavoritesBodyView extends StatelessWidget {
  const FavoritesBodyView({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavoriteBloc, FavoriteState>(
      builder: (context, state) {
        if (state is FetchFavoriteDataSuccessState) {
          return state.favoriteModel.isEmpty
              ? const CustomErrorWidget(
                  icon: CupertinoIcons.heart_slash_fill,
                  title: 'Favorites is empty')
              : Padding(
                  padding: const EdgeInsets.only(bottom: 20.0, top: 10.0),
                  child: ListView.separated(
                    physics: const BouncingScrollPhysics(),
                    separatorBuilder: (context, index) =>
                        const SizedBox(height: 20.0),
                    itemCount: state.favoriteModel.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          pushRouter(
                              AppRoutes.booksDetailsFavoriteView, context,
                              extra: state.favoriteModel[index]);
                        },
                        child: ListViewItems(
                            favoritesModel: state.favoriteModel[index]),
                      );
                    },
                  ),
                );
        } else if (state is FetchFavoriteDataFailureState) {
          return ErrorDemoWidget(error: state.errorMessage);
        } else {
          return const CustomLoadingIndicator(color: Colors.black);
        }
      },
    );
  }
}
