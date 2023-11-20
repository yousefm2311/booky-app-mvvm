import 'package:bookly_full_app_mvvm/core/utils/services/services_locator.dart';
import 'package:bookly_full_app_mvvm/features/auth/data/repos/auth_repo_impl.dart';
import 'package:bookly_full_app_mvvm/features/auth/presentition/view_model/bloc_auth/auth_bloc.dart';
import 'package:bookly_full_app_mvvm/features/auth/presentition/views/login_view.dart';
import 'package:bookly_full_app_mvvm/features/auth/presentition/views/register_view.dart';
import 'package:bookly_full_app_mvvm/features/auth/presentition/views/reset_password.dart';
import 'package:bookly_full_app_mvvm/features/books_details_view/presentition/views/books_details_view.dart';
import 'package:bookly_full_app_mvvm/features/bottom_navi_bar/presentition/views/bottom_navi_bar_view.dart';
import 'package:bookly_full_app_mvvm/features/bubbles_selection/presentition/views/bubbles_selection_view.dart';
import 'package:bookly_full_app_mvvm/features/favorites/data/models/favorites_model.dart';
import 'package:bookly_full_app_mvvm/features/favorites/presentition/views/book_details_favorites.dart';
import 'package:bookly_full_app_mvvm/features/favorites/presentition/views/favorites_view.dart';
import 'package:bookly_full_app_mvvm/features/home/data/models/book_model/book_model.dart';
import 'package:bookly_full_app_mvvm/features/home/data/repos/home_repo_impl.dart';
import 'package:bookly_full_app_mvvm/features/home/presentition/view_model/home_bloc/home_bloc.dart';
import 'package:bookly_full_app_mvvm/features/home/presentition/views/home_view.dart';
import 'package:bookly_full_app_mvvm/features/profile/presentition/views/profile_view.dart';
import 'package:bookly_full_app_mvvm/features/search/presentition/views/search_view.dart';
import 'package:bookly_full_app_mvvm/features/splash/presentition/view/splash_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

abstract class AppRoutes {
  static final routes = GoRouter(routes: [
    GoRoute(
      path: homeView,
      builder: (context, state) => BlocProvider(
          create: (context) => HomeBloc(getIt.get<HomeRepoImpl>()),
          child: const HomeView()),
    ),
    GoRoute(
      path: splashView,
      builder: (context, state) => const SplashView(),
    ),
    GoRoute(
      path: favoritesView,
      builder: (context, state) => const FavoritesView(),
    ),
    GoRoute(
      path: bottomNaviBarView,
      builder: (context, state) => const BottomNaviBarView(),
    ),
    GoRoute(
      path: profileView,
      builder: (context, state) => const ProfileView(),
    ),
    GoRoute(
      path: searchView,
      builder: (context, state) => const SearchView(),
    ),
    GoRoute(
      path: bubblesSelectionView,
      builder: (context, state) => const BubbleSelection(),
    ),
    GoRoute(
      path: booksDetailsView,
      builder: (context, state) => BooksDetailsView(
        bookModel: state.extra as BookModel,
      ),
    ),
    GoRoute(
      path: booksDetailsFavoriteView,
      builder: (context, state) => BooksDetailsFavoriteView(
        favoritesModel: state.extra as FavoritesModel,
      ),
    ),
    GoRoute(
      path: resetPasswordView,
      builder: (context, state) => BlocProvider(
        create: (context) => AuthBloc(getIt.get<AuthRepoImpl>()),
        child: const ResetPasswordView(),
      ),
    ),
    GoRoute(
      path: loginView,
      builder: (context, state) => BlocProvider(
        create: (context) => AuthBloc(getIt.get<AuthRepoImpl>()),
        child: const LoginView(),
      ),
      pageBuilder: (context, state) => CustomTransitionPage(
        child: BlocProvider(
          create: (context) => AuthBloc(getIt.get<AuthRepoImpl>()),
          child: const LoginView(),
        ),
        key: state.pageKey,
        transitionsBuilder: (context, animation, secondaryAnimation, child) =>
            FadeTransition(
                opacity: CurvedAnimation(
                    parent: animation, curve: Curves.fastLinearToSlowEaseIn),
                child: child),
      ),
    ),
    GoRoute(
      path: registerView,
      builder: (context, state) => BlocProvider(
        create: (context) => AuthBloc(getIt.get<AuthRepoImpl>()),
        child: const RegisterView(),
      ),
      pageBuilder: (context, state) => CustomTransitionPage(
        child: BlocProvider(
          create: (context) => AuthBloc(getIt.get<AuthRepoImpl>()),
          child: const RegisterView(),
        ),
        key: state.pageKey,
        transitionsBuilder: (context, animation, secondaryAnimation, child) =>
            FadeTransition(
                opacity: CurvedAnimation(
                    parent: animation, curve: Curves.fastLinearToSlowEaseIn),
                child: child),
      ),
    ),
  ]);
  static String splashView = '/';
  static String homeView = '/homeView';
  static String booksDetailsView = '/booksDetailsView';
  static String booksDetailsFavoriteView = '/booksDetailsFavoriteView';
  static String loginView = '/loginView';
  static String resetPasswordView = '/resetPasswordView';
  static String registerView = '/registerView';
  static String favoritesView = '/favoritesView';
  static String bottomNaviBarView = '/bottomNaviBarView';
  static String profileView = '/profileView';
  static String searchView = '/searchView';
  static String bubblesSelectionView = '/bubblesSelectionView';
}
