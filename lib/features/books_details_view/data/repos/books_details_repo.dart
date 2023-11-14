import 'package:bookly_full_app_mvvm/core/errors/failure_firestore.dart';
import 'package:dartz/dartz.dart';

abstract class BookDetailsRepo {
  Future<Either<FirestoreFailure,void>> addBookDetailsFavorite({favoritesModel});
}
