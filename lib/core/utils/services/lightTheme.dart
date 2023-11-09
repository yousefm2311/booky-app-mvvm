// ignore_for_file: file_names

import 'package:bookly_full_app_mvvm/core/utils/colors.dart';
import 'package:flutter/material.dart';

class LightTheme {
  ThemeData customLightTheme = ThemeData.light().copyWith(
    scaffoldBackgroundColor: AppColors.kPrimaryColor,
    bottomSheetTheme: const BottomSheetThemeData(
      backgroundColor: AppColors.kPrimaryColor,
    ),
  );
}
