
import 'package:bookly_full_app_mvvm/core/errors/failure_firestore.dart';
import 'package:bookly_full_app_mvvm/core/utils/services/firestore_services.dart';
import 'package:bookly_full_app_mvvm/features/auth/data/models/auth_model.dart';
import 'package:bookly_full_app_mvvm/features/profile/data/repos/profile_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ProfileRepoImpl extends ProfileRepo {
  @override
  Future<Either<FirestoreFailure, AuthModel>> fetchProfileData({uId}) async {
    try {
      var result = await FireStoreUser().getUserDataFromFirebase(uId);
      AuthModel authModel = AuthModel.fromJson(result.data());
      return right(authModel);
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
