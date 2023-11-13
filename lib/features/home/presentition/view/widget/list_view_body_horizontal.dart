import 'package:bookly_full_app_mvvm/core/widgets/custom_image.dart';
import 'package:flutter/material.dart';

class ListViewBodyHorizontal extends StatelessWidget {
  const ListViewBodyHorizontal({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.sizeOf(context).height * .23,
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        itemCount: 10,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return const CustomImageView(imageUrl: '', aspectRatio: 5.3 / 7);
        },
      ),
    );
  }
}
