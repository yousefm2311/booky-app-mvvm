
import 'package:bookly_full_app_mvvm/core/errors/failure_firestore.dart';
import 'package:bookly_full_app_mvvm/features/auth/data/models/auth_model.dart';
import 'package:dartz/dartz.dart';

abstract class ProfileRepo {
  Future<Either<FirestoreFailure, AuthModel>> fetchProfileData({uId});
}
