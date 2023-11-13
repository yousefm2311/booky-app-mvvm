
import 'package:bookly_full_app_mvvm/core/utils/local_storage/local_storage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';



final FirebaseAuth auth = FirebaseAuth.instance;

  final CollectionReference userCollectionRef =
      FirebaseFirestore.instance.collection('users');

LocalStorage localStorage = LocalStorage();

final GoogleSignIn googleSignIn = GoogleSignIn(scopes: [
    'email',
    'profile',
  ]);