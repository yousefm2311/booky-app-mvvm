import 'package:bookly_full_app_mvvm/core/utils/styles.dart';
import 'package:bookly_full_app_mvvm/features/home/presentition/views/widget/grid_view_newset_seller.dart';
import 'package:bookly_full_app_mvvm/features/home/presentition/views/widget/list_view_body_horizontal.dart';
import 'package:flutter/material.dart';

class HomeBodyView extends StatelessWidget {
  const HomeBodyView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15.0, top: 20.0),
      child: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const ListViewBodyHorizontal(),
                const SizedBox(height: 25.0),
                Text('Newset Seller',
                    style: Styles.textStyle24.copyWith(color: Colors.black)),
                const SizedBox(height: 20.0),
              ],
            ),
          ),
          const GridViewNewsetSeller(),
        ],
      ),
    );
  }
}
