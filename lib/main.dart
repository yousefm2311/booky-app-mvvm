import 'package:bookly_full_app_mvvm/core/utils/routes/routes.dart';
import 'package:bookly_full_app_mvvm/core/utils/services/darkTheme.dart';
import 'package:bookly_full_app_mvvm/core/utils/services/lightTheme.dart';
import 'package:flutter/material.dart';
void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: AppRoutes.routes ,
      debugShowCheckedModeBanner: false,
        theme: LightTheme().customLightTheme,
        darkTheme: DarkTheme().customDarkTheme,
        themeMode: ThemeMode.dark,
    );
  }
}
