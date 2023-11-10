import 'package:bookly_full_app_mvvm/features/auth/presentition/views/widget/register_body_view.dart';
import 'package:flutter/material.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: const RegisterBodyView(),
    );
  }
}
