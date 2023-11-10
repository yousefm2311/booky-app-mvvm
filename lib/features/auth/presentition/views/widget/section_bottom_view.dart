import 'package:bookly_full_app_mvvm/core/utils/styles.dart';
import 'package:bookly_full_app_mvvm/core/widgets/custom_text_button.dart';
import 'package:flutter/material.dart';

class SectionBottomView extends StatelessWidget {
  const SectionBottomView(
      {super.key,
      required this.text,
      required this.buttonTitle,
      this.onPressed});

  final String text, buttonTitle;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          text,
          style: Styles.textStyle16,
        ),
        const SizedBox(width: 5.0),
        CustomTextButton(
          text: buttonTitle,
          onPressed: onPressed,
        )
      ],
    );
  }
}
