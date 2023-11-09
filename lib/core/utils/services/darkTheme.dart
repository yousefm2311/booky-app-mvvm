// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DarkTheme {
  ThemeData customDarkTheme = ThemeData.dark().copyWith(
    scaffoldBackgroundColor: Colors.white,
    textTheme: GoogleFonts.montserratTextTheme(ThemeData.dark().textTheme),
    bottomSheetTheme: const BottomSheetThemeData(
      backgroundColor: Colors.white,
    ),
  );
}
