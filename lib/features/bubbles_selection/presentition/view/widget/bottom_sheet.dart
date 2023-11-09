import 'package:bookly_full_app_mvvm/core/widgets/button.dart';
import 'package:flutter/material.dart';

class BottomSheetView extends StatelessWidget {
  const BottomSheetView({super.key});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: CustomButton(
        text: 'NEXT',
        onPressed: () {},
      ),
    );
  }
}
