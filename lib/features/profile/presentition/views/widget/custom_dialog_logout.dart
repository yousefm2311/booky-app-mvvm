import 'package:bookly_full_app_mvvm/core/utils/colors.dart';
import 'package:bookly_full_app_mvvm/core/utils/functions/navigator.dart';
import 'package:bookly_full_app_mvvm/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:giffy_dialog/giffy_dialog.dart';

class CustomDialogLogout extends StatelessWidget {
  const CustomDialogLogout({super.key, this.onPressed});

  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return GiffyDialog(
        giffy: Column(
      children: [
        Text(
          'Are you sure you want to logout?',
          style: Styles.textStyle14.copyWith(color: Colors.black),
        ),
        const SizedBox(height: 20.0),
        SizedBox(
          height: 50,
          child: Row(
            children: [
              MaterialButton(
                color: AppColors.kGreyColor,
                child: Text('close',
                    style: Styles.textStyle14.copyWith(color: Colors.black54)),
                onPressed: () {
                  popRouter(context);
                },
              ),
              const Spacer(),
              MaterialButton(
                color: AppColors.kSecondColor,
                onPressed: onPressed,
                child: Text('Logout',
                    style: Styles.textStyle14.copyWith(color: Colors.white)),
              )
            ],
          ),
        )
      ],
    ));
  }
}
