
import 'package:bookly_full_app_mvvm/core/errors/failure_firestore.dart';
import 'package:bookly_full_app_mvvm/features/favorites/data/models/favorites_model.dart';
import 'package:dartz/dartz.dart';

abstract class FavoritesRepo {
  Future<Either<FirestoreFailure, List<FavoritesModel>>> fetchFavoriteData();
  Future<Either<FirestoreFailure, void>> removeFavoriteData({id});
}
