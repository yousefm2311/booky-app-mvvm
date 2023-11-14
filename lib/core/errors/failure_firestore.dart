import 'package:firebase_auth/firebase_auth.dart';

abstract class FirestoreFailure {
  final String errorMessage;
  const FirestoreFailure(this.errorMessage);
}

// Create a specific class for Firestore data retrieval failures that extends FirestoreFailure
class DataFetchFailure extends FirestoreFailure {
  DataFetchFailure(String errorMessage) : super(errorMessage);

  // Factory method to create a DataFetchFailure instance based on a FirebaseException
  factory DataFetchFailure.fromFirebaseException(FirebaseException firebaseException) {
    switch (firebaseException.code) {
      case 'permission-denied':
        return DataFetchFailure('Permission denied, check your Firestore rules');
      case 'unauthenticated':
        return DataFetchFailure('User is unauthenticated');
      case 'cancelled':
        return DataFetchFailure('The operation was cancelled');
      case 'unknown':
        return DataFetchFailure('An unknown error occurred');
      default:
        return DataFetchFailure(
            'Unexpected error occurred, please try again later');
    }
  }
}