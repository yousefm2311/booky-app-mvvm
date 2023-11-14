import 'package:bookly_full_app_mvvm/core/utils/api_services.dart';
import 'package:bookly_full_app_mvvm/features/auth/data/repos/auth_repo_impl.dart';
import 'package:bookly_full_app_mvvm/features/favorites/data/repos/favorite_repo_impl.dart';
import 'package:bookly_full_app_mvvm/features/home/data/repos/home_repo_impl.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setupServiceLocator() {
  getIt.registerSingleton<AuthRepoImpl>(AuthRepoImpl());
  getIt.registerSingleton<ApiService>(ApiService());
  getIt.registerSingleton<FavoriteRepoImpl>(FavoriteRepoImpl());
  getIt.registerSingleton<HomeRepoImpl>(HomeRepoImpl(getIt.get<ApiService>()));
}
