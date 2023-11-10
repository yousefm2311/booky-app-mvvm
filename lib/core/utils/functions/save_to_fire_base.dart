  import 'package:bookly_full_app_mvvm/core/utils/services/firestore_services.dart';
import 'package:bookly_full_app_mvvm/features/auth/data/models/auth_model.dart';
import 'package:firebase_auth/firebase_auth.dart';

void saveToFireStore(UserCredential user,nameRegisterController) async {
    AuthModel authModel = AuthModel(
        uId: user.user!.uid,
        email: user.user!.email,
        name: nameRegisterController.text.isEmpty
            ? user.user!.displayName
            : nameRegisterController.text,
        image: user.user!.photoURL ??
            'https://t4.ftcdn.net/jpg/01/18/03/35/360_F_118033506_uMrhnrjBWBxVE9sYGTgBht8S5liVnIeY.jpg');
    FireStoreUser().addUserToFireStore(authModel);
  }