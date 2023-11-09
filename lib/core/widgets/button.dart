import 'package:bookly_full_app_mvvm/core/utils/colors.dart';
import 'package:bookly_full_app_mvvm/core/utils/styles.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key, required this.text, required this.onPressed});
  final String text;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 60,
      decoration: BoxDecoration(
          color: AppColors.kSecondColor,
          borderRadius: BorderRadius.circular(12.0)),
      child: MaterialButton(
        onPressed: onPressed,
        child: Text(
          text,
          style: Styles.textStyle20,
        ),
      ),
    );
  }
}
