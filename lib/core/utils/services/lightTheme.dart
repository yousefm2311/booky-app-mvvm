// ignore_for_file: file_names

import 'package:bookly_full_app_mvvm/core/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LightTheme {
  ThemeData customLightTheme = ThemeData.light().copyWith(
    scaffoldBackgroundColor: Colors.white,
    primaryColor: AppColors.kPrimaryColor,
    appBarTheme: const AppBarTheme(
      elevation: 0,
      backgroundColor: AppColors.kPrimaryColor,
    ),
    textTheme: GoogleFonts.montserratTextTheme(ThemeData.dark().textTheme),
    bottomSheetTheme: const BottomSheetThemeData(
      backgroundColor: AppColors.kPrimaryColor,
    ),
  );
}
