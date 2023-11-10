// ignore_for_file: deprecated_member_use
import 'package:firebase_auth/firebase_auth.dart';

abstract class FirebaseFailure {
  final String errorMessage;
  const FirebaseFailure(this.errorMessage);
}

class AuthFailure extends FirebaseFailure {
  AuthFailure(super.errorMessage);

  factory AuthFailure.fromFirebaseAuthException(
      FirebaseAuthException authException) {
    switch (authException.code) {
      case 'user-not-found':
        return AuthFailure('User not found');
      case 'wrong-password':
        return AuthFailure('Wrong password');
      case 'email-already-in-use':
        return AuthFailure('Email is already in use');
      case 'invalid-email':
        return AuthFailure('Invalid email address');
      case 'user-disabled':
        return AuthFailure('User account has been disabled');
      case 'operation-not-allowed':
        return AuthFailure('Operation not allowed');
      case 'too-many-requests':
        return AuthFailure('Too many requests, try again later');
      case 'weak-password':
        return AuthFailure('Weak password, please choose a stronger one');
      case 'INVALID_LOGIN_CREDENTIALS':
        return AuthFailure('Login credentials are invalid.');
      default:
        return AuthFailure('Unexpected error occurred, please try again later');
    }
  }
}

class FirestoreFailure extends FirebaseFailure {
  FirestoreFailure(super.errorMessage);

  factory FirestoreFailure.fromFirebaseFirestoreException(firestoreException) {
    switch (firestoreException.code) {
      case 'cancelled':
        return FirestoreFailure('The operation was cancelled');
      case 'unknown':
        return FirestoreFailure('An unknown error occurred');
      case 'invalid-argument':
        return FirestoreFailure('Invalid argument provided');
      case 'not-found':
        return FirestoreFailure('The requested document was not found');
      case 'already-exists':
        return FirestoreFailure('The document already exists');
      case 'permission-denied':
        return FirestoreFailure('Permission denied to perform the operation');
      default:
        return FirestoreFailure(
            'Unexpected error occurred, please try again later');
    }
  }
}
