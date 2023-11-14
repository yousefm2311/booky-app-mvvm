import 'package:bookly_full_app_mvvm/core/utils/assets.dart';
import 'package:bookly_full_app_mvvm/core/utils/functions/navigator.dart';
import 'package:bookly_full_app_mvvm/core/utils/routes/routes.dart';
import 'package:bookly_full_app_mvvm/core/utils/services/services_locator.dart';
import 'package:bookly_full_app_mvvm/core/widgets/custom_image.dart';
import 'package:bookly_full_app_mvvm/core/widgets/custom_loading_indicator.dart';
import 'package:bookly_full_app_mvvm/core/widgets/error_widget.dart';
import 'package:bookly_full_app_mvvm/features/home/data/repos/home_repo_impl.dart';
import 'package:bookly_full_app_mvvm/features/home/presentition/view_model/home_bloc/home_bloc.dart';
import 'package:bookly_full_app_mvvm/features/home/presentition/view_model/home_bloc/home_event.dart';
import 'package:bookly_full_app_mvvm/features/home/presentition/view_model/home_bloc/home_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ListViewBodyHorizontal extends StatelessWidget {
  const ListViewBodyHorizontal({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      bloc: HomeBloc(getIt.get<HomeRepoImpl>())
        ..add(
          FetchBookHomeListViewEvent(),
        ),
      builder: (context, state) {
        if (state is FetchBookHomeListViewSuccessState) {
          return SizedBox(
            height: MediaQuery.sizeOf(context).height * .23,
            child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              itemCount: state.books.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    pushRouter(AppRoutes.booksDetailsView, context,
                        extra: state.books[index]);
                  },
                  child: CustomImageView(
                      imageUrl:
                          state.books[index].volumeInfo.imageLinks?.thumbnail ??
                              AssetsData.errorImage,
                      aspectRatio: 5.3 / 7),
                );
              },
            ),
          );
        } else if (state is FetchBookHomeListViewFailureState) {
          return ErrorDemoWidget(error: state.errorMessage);
        } else {
          return SizedBox(
              height: MediaQuery.sizeOf(context).height * .23,
              child: const CustomLoadingIndicator(color: Colors.black));
        }
      },
    );
  }
}
