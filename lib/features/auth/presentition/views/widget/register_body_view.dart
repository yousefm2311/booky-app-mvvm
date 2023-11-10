import 'package:bookly_full_app_mvvm/core/utils/styles.dart';
import 'package:bookly_full_app_mvvm/features/auth/presentition/views/widget/clippath_view.dart';
import 'package:flutter/material.dart';

class RegisterBodyView extends StatelessWidget {
  const RegisterBodyView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipPathView(),
        Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: Text('Register', style: Styles.textStyle32)),
        SizedBox(height: 20.0),
      ],
    );
  }
}
