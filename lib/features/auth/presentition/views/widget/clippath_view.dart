import 'package:bookly_full_app_mvvm/core/utils/colors.dart';
import 'package:bookly_full_app_mvvm/features/auth/presentition/views/widget/rounded_clipper.dart';
import 'package:flutter/material.dart';

class ClipPathView extends StatelessWidget {
  const ClipPathView({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: RoundedClipper(),
      child: Container(
        width: double.infinity,
        height: MediaQuery.sizeOf(context).height * .22,
        decoration: const BoxDecoration(
          color: AppColors.kPrimaryColor,
        ),
        child: const Padding(
          padding: EdgeInsets.only(bottom: 80.0),
          child: Icon(
            Icons.menu_book_rounded,
            size: 120,
            color: AppColors.kSecondColor,
          ),
        ),
      ),
    );
  }
}
