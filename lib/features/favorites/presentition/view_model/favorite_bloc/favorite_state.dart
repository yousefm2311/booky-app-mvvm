import 'package:bookly_full_app_mvvm/features/favorites/data/models/favorites_model.dart';

abstract class FavoriteState {}

class FetchFavoriteInitialState extends FavoriteState {}

class FetchFavoriteDataSuccessState extends FavoriteState {
  final List<FavoritesModel> favoriteModel;

  FetchFavoriteDataSuccessState({required this.favoriteModel});
}

class FetchFavoriteDataFailureState extends FavoriteState {
  final String errorMessage;

  FetchFavoriteDataFailureState({required this.errorMessage});
}

class FetchFavoriteDataLoadingState extends FavoriteState {}
