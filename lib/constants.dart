
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';



final FirebaseAuth auth = FirebaseAuth.instance;

  final CollectionReference userCollectionRef =
      FirebaseFirestore.instance.collection('users');