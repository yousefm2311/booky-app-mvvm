import 'package:bookly_full_app_mvvm/constants.dart';
import 'package:bookly_full_app_mvvm/core/utils/functions/custom_snack_bar.dart';
import 'package:bookly_full_app_mvvm/core/utils/functions/navigator.dart';
import 'package:bookly_full_app_mvvm/core/utils/routes/routes.dart';
import 'package:bookly_full_app_mvvm/core/utils/styles.dart';
import 'package:bookly_full_app_mvvm/core/widgets/button.dart';
import 'package:flutter/material.dart';

class BottomSheetView extends StatelessWidget {
  const BottomSheetView({super.key, required this.selection});

  final List<String> selection;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: CustomButton(
        text: Text(
          'NEXT',
          style: Styles.textStyle20.copyWith(color: Colors.white),
        ),
        onPressed: () {
          if (selection.isEmpty) {
            customSnackBar(context, text: 'Please select category');
          } else {
            localStorage
                .saveData(key: 'bubblesSelection', value: selection)
                .then((value) {
              pushReplacementRouter(AppRoutes.bottomNaviBarView, context);
            });
          }
        },
      ),
    );
  }
}
