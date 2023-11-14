import 'package:bookly_full_app_mvvm/core/utils/functions/navigator.dart';
import 'package:bookly_full_app_mvvm/core/utils/routes/routes.dart';
import 'package:bookly_full_app_mvvm/core/widgets/custom_loading_indicator.dart';
import 'package:bookly_full_app_mvvm/core/widgets/error_widget.dart';
import 'package:bookly_full_app_mvvm/features/home/presentition/view_model/home_bloc/home_bloc.dart';
import 'package:bookly_full_app_mvvm/features/home/presentition/view_model/home_bloc/home_state.dart';
import 'package:bookly_full_app_mvvm/features/home/presentition/views/widget/grid_view_items.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GridViewNewsetSeller extends StatelessWidget {
  const GridViewNewsetSeller({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        if (state is FetchBooksHomeSuccessState) {
          return SliverGrid.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: MediaQuery.sizeOf(context).height * .001,
                childAspectRatio: MediaQuery.sizeOf(context).height * .000747),
            itemCount: state.books.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  pushRouter(AppRoutes.booksDetailsView, context,
                      extra: state.books[index],);
                },
                child: GridViewItems(bookModel: state.books[index]),
              );
            },
          );
        } else if (state is FetchBooksHomeFailureState) {
          return SliverToBoxAdapter(
              child: ErrorDemoWidget(error: state.errorMessage));
        } else {
          return const SliverToBoxAdapter(
            child: CustomLoadingIndicator(
              color: Colors.black,
            ),
          );
        }
      },
    );
  }
}
