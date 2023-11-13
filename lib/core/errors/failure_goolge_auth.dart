import 'package:firebase_auth/firebase_auth.dart';

abstract class GoogleFailure {
  final String errorMessage;
  const GoogleFailure(this.errorMessage);
}

class GoogleAuthFailure extends GoogleFailure {
  GoogleAuthFailure(super.errorMessage);

  factory GoogleAuthFailure.fromFirebaseAuthException(
      FirebaseAuthException authException) {
    switch (authException.code) {
      case 'account-exists-with-different-credential':
        return GoogleAuthFailure(
            'An account already exists with the same email address but different sign-in credentials. Try signing in with a different provider.');
      case 'invalid-credential':
        return GoogleAuthFailure('Invalid Google credentials');
      case 'operation-not-allowed':
        return GoogleAuthFailure(
            'Google sign-in is not enabled for your Firebase project');
      case 'user-disabled':
        return GoogleAuthFailure('User account has been disabled');
      case 'user-not-found':
        return GoogleAuthFailure('User not found');
      case 'wrong-password':
        return GoogleAuthFailure('Wrong password');
      case 'cancelled':
        return GoogleAuthFailure('The authentication process was cancelled');
      default:
        return GoogleAuthFailure(
            'Unexpected error occurred, please try again later');
    }
  }
}
