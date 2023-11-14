import 'package:bookly_full_app_mvvm/features/search/data/repos/search_repo.dart';
import 'package:bookly_full_app_mvvm/features/search/presentition/view_model/search_bloc/search_event.dart';
import 'package:bookly_full_app_mvvm/features/search/presentition/view_model/search_bloc/search_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  TextEditingController searchController = TextEditingController();
  final SearchRepo searchRepo;
  SearchBloc(this.searchRepo) : super(SearchInitialState()) {
    on<SearchEvent>((event, emit) async {
      if (event is GetSearchEvent) {
        try {
          var result =
              await searchRepo.searchBooks(search: searchController.text);
          result.fold(
            (failure) {
              emit(SearchFailureState(errorMessage: failure.errorMessage));
            },
            (books) {
              // Filter the books based on the search query
              var filteredBooks = books
                  .where((book) => book.volumeInfo.title!
                      .toLowerCase()
                      .contains(searchController.text.toLowerCase()))
                  .toList();
              emit(SearchSuccessState(filteredBooks: filteredBooks));
            },
          );
        } catch (e) {
          emit(SearchFailureState(errorMessage: e.toString()));
        }
      }
    });
  }
}
