import 'package:bookly_full_app_mvvm/core/utils/styles.dart';
import 'package:flutter/material.dart';

class AllBooksView extends StatelessWidget {
  const AllBooksView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Center(
        child: Text(
          'All Books',
          style: Styles.textStyle32.copyWith(color: Colors.black),
        ),
      ),
    );
  }
}
