
import 'package:bookly_full_app_mvvm/features/favorites/data/repos/favorite_repo.dart';
import 'package:bookly_full_app_mvvm/features/favorites/presentition/view_model/favorite_bloc/favorite_event.dart';
import 'package:bookly_full_app_mvvm/features/favorites/presentition/view_model/favorite_bloc/favorite_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavoriteBloc extends Bloc<FavoriteEvent, FavoriteState> {
  final FavoritesRepo favoritesRepo;
  FavoriteBloc(this.favoritesRepo) : super(FetchFavoriteInitialState()) {
    on<FavoriteEvent>((event, emit) async {
      if (event is FetchFavoriteDataEvent) {
        emit(FetchFavoriteDataLoadingState());

        var result = await favoritesRepo.fetchFavoriteData();
        result.fold((failure) {
          emit(FetchFavoriteDataFailureState(
              errorMessage: failure.errorMessage));
          debugPrint(
              '**************************************${failure.errorMessage}');
        }, (favorite) {
          emit(FetchFavoriteDataSuccessState(favoriteModel: favorite));
          debugPrint(favorite.toString());
        });
      }
    });
  }
}
