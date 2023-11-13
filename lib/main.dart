import 'package:bookly_full_app_mvvm/bloc_observer.dart';
import 'package:bookly_full_app_mvvm/constants.dart';
import 'package:bookly_full_app_mvvm/core/utils/routes/routes.dart';
import 'package:bookly_full_app_mvvm/core/utils/services/darkTheme.dart';
import 'package:bookly_full_app_mvvm/core/utils/services/lightTheme.dart';
import 'package:bookly_full_app_mvvm/core/utils/services/services_locator.dart';
import 'package:bookly_full_app_mvvm/core/utils/services/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.android);
  await localStorage.initSharedPreferences();
  Bloc.observer = MyBlocObserver();
  setupServiceLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: AppRoutes.routes,
      debugShowCheckedModeBanner: false,
      theme: LightTheme().customLightTheme,
      darkTheme: DarkTheme().customDarkTheme,
      themeMode: ThemeMode.light,
    );
  }
}
