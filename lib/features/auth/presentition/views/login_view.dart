import 'package:bookly_full_app_mvvm/features/auth/presentition/views/widget/login_body_view.dart';
import 'package:flutter/material.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Container(),
      ),
      body: const LoginBodyView(),
    );
  }
}
