import 'package:animate_do/animate_do.dart';
import 'package:bookly_full_app_mvvm/constants.dart';
import 'package:bookly_full_app_mvvm/core/utils/assets.dart';
import 'package:bookly_full_app_mvvm/core/utils/colors.dart';
import 'package:bookly_full_app_mvvm/core/utils/functions/navigator.dart';
import 'package:bookly_full_app_mvvm/core/utils/routes/routes.dart';
import 'package:flutter/material.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});
  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2), () {
      localStorage.getData(key: 'uId') == null
          ? pushReplacementRouter(AppRoutes.loginView, context)
          : localStorage.getData(key: 'bubblesSelection') == null
              ? pushReplacementRouter(AppRoutes.bubblesSelectionView, context)
              : pushReplacementRouter(AppRoutes.bottomNaviBarView, context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.kPrimaryColor,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.menu_book_rounded,
              size: 100,
              color: AppColors.kSecondColor,
            ),
            const SizedBox(height: 15.0),
            FadeInUp(
              duration: const Duration(milliseconds: 1000),
              child: const SizedBox(
                  height: 50, child: Image(image: AssetImage(AssetsData.logo))),
            )
          ],
        ),
      ),
    );
  }
}
