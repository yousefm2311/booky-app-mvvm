
import 'package:bookly_full_app_mvvm/features/home/presentition/view/widget/grid_view_items.dart';
import 'package:flutter/material.dart';

class GridViewNewsetSeller extends StatelessWidget {
  const GridViewNewsetSeller({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverGrid.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: MediaQuery.sizeOf(context).height * .001,
          childAspectRatio: MediaQuery.sizeOf(context).height * .000747),
      itemCount: 10,
      itemBuilder: (context, index) {
        return const GridViewItems();
      },
    );
  }
}
