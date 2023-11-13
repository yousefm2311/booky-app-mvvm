import 'package:bookly_full_app_mvvm/core/utils/functions/navigator.dart';
import 'package:bookly_full_app_mvvm/core/utils/icon_broken.dart';
import 'package:bookly_full_app_mvvm/features/auth/presentition/views/widget/register_body_view.dart';
import 'package:flutter/material.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => popRouter(context),
          icon: const Icon(IconBroken.Arrow___Left_2, size: 30.0),
        ),
      ),
      body: const RegisterBodyView(),
    );
  }
}
