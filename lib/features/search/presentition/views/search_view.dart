import 'package:bookly_full_app_mvvm/core/utils/services/services_locator.dart';
import 'package:bookly_full_app_mvvm/features/search/data/repos/search_repo_impl.dart';
import 'package:bookly_full_app_mvvm/features/search/presentition/view_model/search_bloc/search_bloc.dart';
import 'package:bookly_full_app_mvvm/features/search/presentition/views/widget/search_body_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SearchBloc(getIt.get<SearchRepoImpl>()),
      child: const SearchBodyView(),
    );
  }
}
