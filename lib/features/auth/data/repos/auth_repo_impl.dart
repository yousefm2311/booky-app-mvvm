import 'package:bookly_full_app_mvvm/constants.dart';
import 'package:bookly_full_app_mvvm/core/errors/failure_firebase.dart';
import 'package:bookly_full_app_mvvm/features/auth/data/repos/auth_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
// import 'package:google_sign_in/google_sign_in.dart';

class AuthRepoImpl implements AuthRepo {
  @override
  Future<Either<FirebaseFailure, UserCredential>> loginMethod(
      {required email, required password}) async {
    try {
      UserCredential result = await auth.signInWithEmailAndPassword(
          email: email, password: password);
      return right(result);
    } on FirebaseAuthException catch (e) {
      return left(AuthFailure.fromFirebaseAuthException(e));
    } catch (e) {
      return left(AuthFailure.fromFirebaseAuthException(
          FirebaseAuthException(code: e.toString())));
    }
  }

  @override
  Future<Either<FirebaseFailure, UserCredential>> registerMethod(
      {required email, required password}) async {
    try {
      UserCredential result = await auth.createUserWithEmailAndPassword(
          email: email, password: password);
      return right(result);
    } on FirebaseAuthException catch (e) {
      return left(AuthFailure.fromFirebaseAuthException(e));
    } catch (e) {
      return left(AuthFailure.fromFirebaseAuthException(
          FirebaseAuthException(code: e.toString())));
    }
  }
}
