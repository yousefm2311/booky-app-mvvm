import 'package:bookly_full_app_mvvm/core/errors/failure_firestore.dart';
import 'package:bookly_full_app_mvvm/core/utils/services/firestore_services.dart';
import 'package:bookly_full_app_mvvm/features/favorites/data/models/favorites_model.dart';
import 'package:bookly_full_app_mvvm/features/favorites/data/repos/favorite_repo.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';

class FavoriteRepoImpl implements FavoritesRepo {
  @override
  Future<Either<FirestoreFailure, List<FavoritesModel>>> fetchFavoriteData(
      {uId}) async {
    try {
      var result = await FireStoreUser().getFavoritesDataFromFirebase();
      List<FavoritesModel> favoritesList = [];
      for (var doc in result.docs) {
        FavoritesModel favoritesModel =
            FavoritesModel.fromJson(doc.data() as Map<String, dynamic>);
        favoritesList.add(favoritesModel);
      }
      return right(favoritesList);
    } catch (e) {
      if (e is FirebaseException) {
        DataFetchFailure dataFetchFailure =
            DataFetchFailure.fromFirebaseException(e);
        return left(dataFetchFailure);
      } else {
        return left(DataFetchFailure('An unexpected error occurred'));
      }
    }
  }

  @override
  Future<Either<FirestoreFailure, void>> removeFavoriteData({id}) async {
    try {
      var result = await FireStoreUser().removeFavoritesDataFromFirebase(id);
      return right(result);
    } catch (e) {
      if (e is FirebaseException) {
        DataFetchFailure dataFetchFailure =
            DataFetchFailure.fromFirebaseException(e);
        return left(dataFetchFailure);
      } else {
        return left(DataFetchFailure('An unexpected error occurred'));
      }
    }
  }
}
