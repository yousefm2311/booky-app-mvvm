import 'package:bookly_full_app_mvvm/core/errors/failure_firebase.dart';
import 'package:bookly_full_app_mvvm/core/errors/failure_goolge_auth.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthRepo {
  Future<Either<FirebaseFailure, UserCredential>> loginMethod(
      {required email, required password});
  Future<Either<FirebaseFailure, UserCredential>> registerMethod(
      {required email, required password});
  Future<Either<FirebaseFailure, void>> ressetPasswordMethod({required email});
  Future<Either<GoogleFailure, UserCredential>> googleMethod();
}
