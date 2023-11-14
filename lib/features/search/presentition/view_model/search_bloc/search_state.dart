import 'package:bookly_full_app_mvvm/features/home/data/models/book_model/book_model.dart';

abstract class SearchState {}

class SearchInitialState extends SearchState {}

class SearchLoadingState extends SearchState {}

class SearchSuccessState extends SearchState {
  final List<BookModel> filteredBooks;

  SearchSuccessState({required this.filteredBooks});
}

class SearchFailureState extends SearchState {
  final String errorMessage;

  SearchFailureState({required this.errorMessage});
}
