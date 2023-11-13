import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CusromLoadingIndicator extends StatelessWidget {
  const CusromLoadingIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CupertinoActivityIndicator(
        color: Colors.white,
      ),
    );
  }
}
