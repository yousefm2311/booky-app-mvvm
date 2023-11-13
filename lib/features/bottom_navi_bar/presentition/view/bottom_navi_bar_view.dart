import 'package:bookly_full_app_mvvm/core/utils/colors.dart';
import 'package:bookly_full_app_mvvm/core/utils/icon_broken.dart';
import 'package:bookly_full_app_mvvm/features/all_books/presentition/view/all_books_view.dart';
import 'package:bookly_full_app_mvvm/features/home/presentition/view/home_view.dart';
import 'package:bookly_full_app_mvvm/features/profile/presentition/view/profile_view.dart';
import 'package:bookly_full_app_mvvm/features/search/presentition/view/search_view.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class BottomNaviBarView extends StatefulWidget {
  const BottomNaviBarView({super.key});

  @override
  State<BottomNaviBarView> createState() => _BottomNaviBarViewState();
}

class _BottomNaviBarViewState extends State<BottomNaviBarView> {
  int count = 0;
  List<Widget> screens = const [
    HomeView(),
    AllBooksView(),
    SearchView(),
    ProfileView()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[count],
      bottomNavigationBar: Container(
        color: AppColors.kPrimaryColor,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: GNav(
            onTabChange: (value) {
              setState(() {
                count = value;
              });
            },
            backgroundColor: AppColors.kPrimaryColor,
            tabBackgroundColor: Colors.grey.shade800,
            color: Colors.grey,
            activeColor: Colors.white,
            padding: const EdgeInsets.all(12.0),
            gap: 8,
            tabs: const [
              GButton(
                icon: IconBroken.Home,
                text: 'Home',
              ),
              GButton(
                icon: Icons.menu_book_rounded,
                text: 'Books',
              ),
              GButton(
                icon: IconBroken.Search,
                text: 'Search',
              ),
              GButton(
                icon: IconBroken.Profile,
                text: 'Profile',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
