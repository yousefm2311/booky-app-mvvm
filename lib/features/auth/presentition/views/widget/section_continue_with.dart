import 'package:bookly_full_app_mvvm/core/utils/assets.dart';
import 'package:bookly_full_app_mvvm/core/utils/colors.dart';
import 'package:bookly_full_app_mvvm/core/utils/styles.dart';
import 'package:bookly_full_app_mvvm/features/auth/presentition/views/widget/custom_divider.dart';
import 'package:flutter/material.dart';

class SectionContinueWithView extends StatelessWidget {
  const SectionContinueWithView({super.key, this.onTap});

  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const CustomDivider(),
            const SizedBox(width: 5.0),
            Text(
              'Or continue with',
              style: Styles.textStyle16.copyWith(color: Colors.black),
            ),
            const SizedBox(width: 5.0),
            const CustomDivider(),
          ],
        ),
        GestureDetector(
          onTap: onTap,
          child: Container(
            width: 60,
            margin: const EdgeInsets.only(top: 20),
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: AppColors.kGreyColor,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Image.asset(AssetsData.googleLogo),
          ),
        )
      ],
    );
  }
}
