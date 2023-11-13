import 'package:bookly_full_app_mvvm/constants.dart';
import 'package:bookly_full_app_mvvm/features/auth/data/models/auth_model.dart';

import 'package:flutter/foundation.dart';

class FireStoreUser {
  Future<void> addUserToFireStore(AuthModel authModel) async {
    return await userCollectionRef
        .doc(authModel.uId)
        .set(authModel.toJson())
        .then((value) {})
        .catchError((error) {
      if (kDebugMode) {
        print(error.toString());
      }
    });
  }

  Future getUserDataFromFirebase(String uId) async {
    return await userCollectionRef.doc(uId).get();
  }
}