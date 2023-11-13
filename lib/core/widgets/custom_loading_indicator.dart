import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomLoadingIndicator extends StatelessWidget {
  const CustomLoadingIndicator({super.key, required this.color});

  final Color color;

  @override
  Widget build(BuildContext context) {
    return  Center(
      child: CupertinoActivityIndicator(
        color: color,
      ),
    );
  }
}
