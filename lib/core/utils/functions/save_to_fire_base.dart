import 'package:bookly_full_app_mvvm/core/utils/assets.dart';
import 'package:bookly_full_app_mvvm/core/utils/services/firestore_services.dart';
import 'package:bookly_full_app_mvvm/features/auth/data/models/auth_model.dart';
import 'package:bookly_full_app_mvvm/features/favorites/data/models/favorites_model.dart';
import 'package:bookly_full_app_mvvm/features/home/data/models/book_model/book_model.dart';
import 'package:firebase_auth/firebase_auth.dart';

void saveToFireStore(UserCredential user, {nameController}) async {
  AuthModel authModel = AuthModel(
    uId: user.user!.uid,
    email: user.user!.email,
    name: nameController != null && nameController.text.isNotEmpty
        ? nameController.text
        : user.user!.displayName ?? 'Default Name',
    image: user.user!.photoURL ??
        'https://t4.ftcdn.net/jpg/01/18/03/35/360_F_118033506_uMrhnrjBWBxVE9sYGTgBht8S5liVnIeY.jpg',
  );
  await FireStoreUser().addUserToFireStore(authModel);
}

void saveFavoritesToFireStore(BookModel bookModel, bool isFavorites) async {
  FavoritesModel favoritesModel = FavoritesModel(
    author: bookModel.volumeInfo.authors?[0] ?? 'No Author available',
    averageRating: bookModel.volumeInfo.averageRating ?? 0.0,
    description: bookModel.volumeInfo.description ?? 'No description available',
    image: bookModel.volumeInfo.imageLinks?.thumbnail ?? AssetsData.errorImage,
    isFavorite: isFavorites,
    title: bookModel.volumeInfo.title,
    id: bookModel.id,
    review: bookModel.volumeInfo.previewLink,
  );
  await FireStoreUser().addFavoriteToFireStore(favoritesModel);
}
