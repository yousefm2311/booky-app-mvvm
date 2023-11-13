import 'package:bookly_full_app_mvvm/constants.dart';
import 'package:bookly_full_app_mvvm/core/errors/failure_firebase.dart';
import 'package:bookly_full_app_mvvm/core/errors/failure_goolge_auth.dart';
import 'package:bookly_full_app_mvvm/features/auth/data/repos/auth_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

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

  @override
  Future<Either<FirebaseFailure, void>> ressetPasswordMethod(
      {required email}) async {
    try {
      var result = await auth.sendPasswordResetEmail(email: email);
      return right(result);
    } on FirebaseAuthException catch (e) {
      return left(AuthFailure.fromFirebaseAuthException(e));
    } catch (e) {
      return left(AuthFailure.fromFirebaseAuthException(
          FirebaseAuthException(code: e.toString())));
    }
  }

  @override
  Future<Either<GoogleFailure, UserCredential>> googleMethod() async {
    try {
      final GoogleSignInAccount? googleUser = await googleSignIn.signIn();
      if (googleUser == null) {
        return left(GoogleAuthFailure('Google Sign-In was cancelled'));
      }
      final GoogleSignInAuthentication googleSignInAuthentication =
          await googleUser.authentication;
      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleSignInAuthentication.accessToken,
        idToken: googleSignInAuthentication.idToken,
      );
      final UserCredential result = await auth.signInWithCredential(credential);
      return right(result);
    } on FirebaseAuthException catch (e) {
      return left(GoogleAuthFailure.fromFirebaseAuthException(e));
    } on GoogleAuthFailure catch (e) {
      return left(e); // Return the original GoogleAuthFailure
    } catch (e) {
      return left(GoogleAuthFailure('Unexpected error occurred: $e'));
    }
  }
}
