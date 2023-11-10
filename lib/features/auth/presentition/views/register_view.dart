import 'package:bookly_full_app_mvvm/core/utils/icon_broken.dart';
import 'package:bookly_full_app_mvvm/features/auth/presentition/views/widget/register_body_view.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            GoRouter.of(context).pop();
          },
          icon: const Icon(IconBroken.Arrow___Left_2),
        ),
      ),
      body: const RegisterBodyView(),
    );
  }
}
