import 'package:bookly_full_app_mvvm/core/errors/failure_firestore.dart';
import 'package:bookly_full_app_mvvm/core/utils/functions/save_to_fire_base.dart';
import 'package:bookly_full_app_mvvm/features/books_details_view/data/repos/books_details_repo.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

class BooksDetailsRepoImpl implements BookDetailsRepo {
  @override
  Future<Either<FirestoreFailure, void>> addBookDetailsFavorite(
      {favoritesModel}) async {
    try {
      var result = saveFavoritesToFireStore(favoritesModel, true);
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
