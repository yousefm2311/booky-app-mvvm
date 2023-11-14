import 'package:bookly_full_app_mvvm/core/utils/colors.dart';
import 'package:bookly_full_app_mvvm/core/utils/functions/save_to_fire_base.dart';
import 'package:bookly_full_app_mvvm/core/utils/icon_broken.dart';
import 'package:bookly_full_app_mvvm/core/widgets/rating_bar.dart';
import 'package:bookly_full_app_mvvm/features/home/data/models/book_model/book_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:share_plus/share_plus.dart';

class SectionRating extends StatelessWidget {
  const SectionRating({super.key, required this.bookModel});

  final BookModel bookModel;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        RatingBar(
            rating: bookModel.volumeInfo.averageRating?.round() ?? 0.0,
            text: bookModel.volumeInfo.averageRating?.round() ?? 0.0),
        const Spacer(),
        GestureDetector(
          onTap: () async {
            saveFavoritesToFireStore(bookModel, true);
          },
          child: Container(
              padding: const EdgeInsets.all(4),
              decoration: BoxDecoration(
                  color: AppColors.kGreyColor,
                  borderRadius: BorderRadius.circular(20)),
              child: const Icon(IconBroken.Heart)),
        ),
        const SizedBox(width: 5.0),
        GestureDetector(
          onTap: () async {
            await Share.share(
              bookModel.volumeInfo.previewLink!
                  .toString()
                  .replaceFirst(':', ''),
              sharePositionOrigin:
                  Rect.fromPoints(const Offset(2, 2), const Offset(3, 3)),
            );
          },
          child: const Icon(CupertinoIcons.share),
        )
      ],
    );
  }
}
