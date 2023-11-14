import 'package:bookly_full_app_mvvm/core/utils/icon_broken.dart';
import 'package:bookly_full_app_mvvm/core/widgets/custom_error_widget.dart';
import 'package:bookly_full_app_mvvm/core/widgets/custom_loading_indicator.dart';
import 'package:bookly_full_app_mvvm/core/widgets/error_widget.dart';
import 'package:bookly_full_app_mvvm/features/auth/presentition/views/widget/custom_text_form_field.dart';
import 'package:bookly_full_app_mvvm/features/search/presentition/view_model/search_bloc/search_bloc.dart';
import 'package:bookly_full_app_mvvm/features/search/presentition/view_model/search_bloc/search_event.dart';
import 'package:bookly_full_app_mvvm/features/search/presentition/view_model/search_bloc/search_state.dart';
import 'package:bookly_full_app_mvvm/features/search/presentition/views/widget/search_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchBodyView extends StatelessWidget {
  const SearchBodyView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomTextFormField(
          hintText: 'search',
          onChanged: (value) {
            BlocProvider.of<SearchBloc>(context).add(GetSearchEvent());
          },
          prefixIcon: const Icon(IconBroken.Search),
          controller: BlocProvider.of<SearchBloc>(context).searchController,
          obscureText: false,
          textInputType: TextInputType.name,
          validator: (value) {
            return null;
          },
        ),
        Expanded(
          child: BlocBuilder<SearchBloc, SearchState>(
            builder: (context, state) {
              if (state is SearchSuccessState) {
                if (state.filteredBooks.isNotEmpty) {
                  return Padding(
                    padding: const EdgeInsets.only(top: 10.0),
                    child: SearchListView(bookModel: state.filteredBooks),
                  );
                } else {
                  return const CustomErrorWidget(
                      icon: IconBroken.Search, title: 'No books found');
                }
              } else if (state is SearchFailureState) {
                return ErrorDemoWidget(error: state.errorMessage.toString());
              } else if (state is SearchLoadingState) {
                return const CustomLoadingIndicator(color: Colors.black);
              } else {
                return const CustomErrorWidget(
                    icon: IconBroken.Search, title: 'Search Empty');
              }
            },
          ),
        )
      ],
    );
  }
}
