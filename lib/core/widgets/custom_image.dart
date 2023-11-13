import 'package:bookly_full_app_mvvm/core/widgets/custom_loading_indicator.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CustomImageView extends StatelessWidget {
  const CustomImageView({
    super.key,
    required this.imageUrl,
    required this.aspectRatio,
  });
  final String imageUrl;
  final double aspectRatio;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: aspectRatio,
      child: CachedNetworkImage(
        errorWidget: (context, url, error) {
          return Container(
            margin: const EdgeInsets.only(right: 14),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12), color: Colors.grey),
            child: const Center(child: Icon(Icons.error, color: Colors.white)),
          );
        },
        imageUrl: imageUrl,
        placeholder: (context, url) => const CustomLoadingIndicator(color: Colors.black,),
        imageBuilder: (context, imageProvider) => Container(
          margin: const EdgeInsets.only(right: 14),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              image: DecorationImage(image: imageProvider, fit: BoxFit.fill)),
        ),
      ),
    );
  }
}
