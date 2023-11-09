import 'package:bookly_full_app_mvvm/features/all_books/presentition/view/all_books_view.dart';
import 'package:bookly_full_app_mvvm/features/bottom_navi_bar/presentition/view/bottom_navi_bar_view.dart';
import 'package:bookly_full_app_mvvm/features/bubbles_selection/presentition/view/bubbles_selection_view.dart';
import 'package:bookly_full_app_mvvm/features/home/presentition/view/home_view.dart';
import 'package:bookly_full_app_mvvm/features/profile/presentition/view/profile_view.dart';
import 'package:bookly_full_app_mvvm/features/search/presentition/view/search_view.dart';
import 'package:bookly_full_app_mvvm/features/splash/presentition/view/splash_view.dart';
import 'package:go_router/go_router.dart';

abstract class AppRoutes {
  static final routes = GoRouter(routes: [
    GoRoute(
      path: homeView,
      builder: (context, state) => const HomeView(),
    ),
    GoRoute(
      path: splashView,
      builder: (context, state) => const SplashView(),
    ),
    GoRoute(
      path: allBooksView,
      builder: (context, state) => const AllBooksView(),
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
  ]);
  static String splashView = '/';
  static String homeView = '/homeView';
  static String allBooksView = '/allBooksView';
  static String bottomNaviBarView = '/bottomNaviBarView';
  static String profileView = '/profileView';
  static String searchView = '/searchView';
  static String bubblesSelectionView = '/bubblesSelectionView';
}
