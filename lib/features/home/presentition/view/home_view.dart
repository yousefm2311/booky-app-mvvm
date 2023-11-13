import 'package:bookly_full_app_mvvm/constants.dart';
import 'package:bookly_full_app_mvvm/features/home/presentition/view/widget/home_body_view.dart';
import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    var list = localStorage.getListData(key: 'bubblesSelection');
    debugPrint(list.toString());
    return const HomeBodyView();
  }
}
