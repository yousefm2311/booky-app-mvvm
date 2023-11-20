import 'package:bookly_full_app_mvvm/core/utils/assets.dart';
import 'package:bookly_full_app_mvvm/core/utils/functions/custom_snack_bar.dart';
import 'package:bookly_full_app_mvvm/core/utils/styles.dart';
import 'package:bookly_full_app_mvvm/core/widgets/custom_image.dart';
import 'package:bookly_full_app_mvvm/features/auth/data/models/auth_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ContainerInfo extends StatelessWidget {
  const ContainerInfo({super.key, required this.authModel});

  final AuthModel authModel;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const SizedBox(height: 20.0),
        Container(
          width: 150,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
          ),
          child: CustomImageView(
              imageUrl: authModel.image ?? AssetsData.errorImage,
              aspectRatio: 0.9),
        ),
        const SizedBox(height: 20.0),
        Text(
          authModel.name!,
          style: Styles.textStyle22.copyWith(color: Colors.black),
        ),
        const SizedBox(height: 5.0),
        SizedBox(
          child: Text(
            authModel.bio ?? '',
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: Styles.textStyle14
                .copyWith(color: Colors.black, fontWeight: FontWeight.w300),
          ),
        ),
        const SizedBox(height: 5.0),
        GestureDetector(
          onTap: () {
            Clipboard.setData(ClipboardData(text: authModel.email!));
            customSnackBar(context, text: 'copy with email address');
          },
          child: Text(
            authModel.email ?? '',
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: Styles.textStyle14
                .copyWith(color: Colors.black, fontWeight: FontWeight.w300),
          ),
        ),
      ],
    );
  }
}
