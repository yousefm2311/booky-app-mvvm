import 'package:bookly_full_app_mvvm/constants.dart';
import 'package:bookly_full_app_mvvm/features/auth/data/models/auth_model.dart';
import 'package:bookly_full_app_mvvm/features/favorites/data/models/favorites_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

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

  Future<void> addFavoriteToFireStore(FavoritesModel favoritesModel) async {
    return await favoritesCollectionRef
        .doc(uId)
        .collection('favorites')
        .doc(favoritesModel.id)
        .set(favoritesModel.toJson())
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

  Future<QuerySnapshot> getFavoritesDataFromFirebase() async {
    try {
      return await favoritesCollectionRef
          .doc(uId)
          .collection('favorites')
          .get();
    } catch (e) {
      throw e.toString();
    }
  }

  Future<void> removeFavoritesDataFromFirebase(id) async {
    try {
      return await favoritesCollectionRef
          .doc(uId)
          .collection('favorites')
          .doc(id)
          .delete();
    } catch (e) {
      throw e.toString();
    }
  }

  Future updateProfile(String uId, AuthModel authModel) async {
    return await userCollectionRef.doc(uId).update(authModel.toJson());
  }
}
