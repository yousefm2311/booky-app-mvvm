import 'package:bookly_full_app_mvvm/core/utils/colors.dart';

import 'package:bookly_full_app_mvvm/core/utils/styles.dart';
import 'package:flutter/material.dart';

class ContainerItemProfile extends StatelessWidget {
  const ContainerItemProfile({
    super.key,
    required this.title,
    this.onTap,
    required this.icon,
  });

  final String title;
  final Function()? onTap;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 70,
        decoration: BoxDecoration(
          color: AppColors.kGreyColor,
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: Row(
          children: [
            const SizedBox(width: 20.0),
            Text(
              title,
              style: Styles.textStyle16
                  .copyWith(color: Colors.black, fontWeight: FontWeight.w300),
            ),
            const Spacer(),
            Icon(icon),
            const SizedBox(width: 10.0),
          ],
        ),
      ),
    );
  }
}
