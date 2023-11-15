import 'package:bookly_full_app_mvvm/core/utils/api_services.dart';
import 'package:bookly_full_app_mvvm/features/auth/data/repos/auth_repo_impl.dart';
import 'package:bookly_full_app_mvvm/features/books_details_view/data/repos/books_details_repo_impl.dart';
import 'package:bookly_full_app_mvvm/features/favorites/data/repos/favorite_repo_impl.dart';
import 'package:bookly_full_app_mvvm/features/home/data/repos/home_repo_impl.dart';
import 'package:bookly_full_app_mvvm/features/profile/data/repos/profile_repo_impl.dart';
import 'package:bookly_full_app_mvvm/features/search/data/repos/search_repo_impl.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setupServiceLocator() {
  getIt.registerSingleton<AuthRepoImpl>(AuthRepoImpl());
  getIt.registerSingleton<ApiService>(ApiService());
  getIt.registerSingleton<FavoriteRepoImpl>(FavoriteRepoImpl());
  getIt.registerSingleton<ProfileRepoImpl>(ProfileRepoImpl());
  getIt.registerSingleton<BooksDetailsRepoImpl>(BooksDetailsRepoImpl());
  getIt.registerSingleton<HomeRepoImpl>(HomeRepoImpl(getIt.get<ApiService>()));
  getIt.registerSingleton<SearchRepoImpl>(SearchRepoImpl(getIt.get<ApiService>()));
}
