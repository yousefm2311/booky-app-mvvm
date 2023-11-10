import 'package:bookly_full_app_mvvm/core/utils/colors.dart';
import 'package:bookly_full_app_mvvm/core/utils/styles.dart';
import 'package:bookly_full_app_mvvm/features/bubbles_selection/data/model/model_bubbles.dart';
import 'package:flutter/material.dart';

class BubblesWidget extends StatelessWidget {
  const BubblesWidget(
      {super.key,
      required this.onTap,
      required this.modelBubbles,
      required this.isSelected});
  final Function()? onTap;
  final bool isSelected;
  final ModelBubbles modelBubbles;
  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: modelBubbles.top,
      left: modelBubbles.left,
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          width: modelBubbles.width,
          height: modelBubbles.height,
          decoration: BoxDecoration(
              boxShadow: isSelected == true
                  ? [
                      BoxShadow(
                        color: modelBubbles.color,
                        blurRadius: 10,
                        blurStyle: BlurStyle.solid,
                        spreadRadius: 5,
                        offset: Offset.zero,
                      )
                    ]
                  : [],
              color: isSelected ? modelBubbles.color : AppColors.kPrimaryColor,
              borderRadius: BorderRadius.circular(100)),
          child: Center(
            child: Text(
              modelBubbles.text,
              style: Styles.textStyle14,
            ),
          ),
        ),
      ),
    );
  }
}
