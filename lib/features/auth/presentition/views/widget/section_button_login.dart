import 'package:bookly_full_app_mvvm/core/widgets/button.dart';
import 'package:bookly_full_app_mvvm/core/widgets/custom_text_button.dart';
import 'package:flutter/material.dart';

class SectionButtonLogin extends StatelessWidget {
  const SectionButtonLogin({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
          alignment: AlignmentDirectional.centerEnd,
          child: CustomTextButton(text: 'forgot password?', onPressed: () {}),
        ),
        const SizedBox(height: 10.0),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: CustomButton(
            text: 'Login',
            onPressed: () {},
          ),
        )
      ],
    );
  }
}