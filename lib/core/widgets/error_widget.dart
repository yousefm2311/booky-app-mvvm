import 'package:bookly_full_app_mvvm/core/utils/styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ErrorDemoWidget extends StatelessWidget {
  const ErrorDemoWidget({super.key, required this.error});
  final String error;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(
            CupertinoIcons.xmark_shield_fill,
            size: 150,
            color: Colors.red,
          ),
          Text(error,
              style: Styles.textStyle20
                  .copyWith(color: Colors.black, fontSize: 20.0)),
        ],
      ),
    );
  }
}
