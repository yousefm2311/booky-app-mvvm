import 'package:bookly_full_app_mvvm/core/utils/styles.dart';
import 'package:flutter/material.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Center(
        child: Text(
          'Search',
          style: Styles.textStyle32.copyWith(color: Colors.black),
        ),
      ),
    );
  }
}
