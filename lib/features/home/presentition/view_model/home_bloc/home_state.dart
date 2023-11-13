import 'package:bookly_full_app_mvvm/features/home/data/models/book_model/book_model.dart';
import 'package:equatable/equatable.dart';

abstract class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object> get props => [];
}

class FetchBooksHomeInitialState extends HomeState {}

class FetchBooksHomeLoadingState extends HomeState {}

class FetchBooksHomeFailureState extends HomeState {
  final String errorMessage;

  const FetchBooksHomeFailureState({required this.errorMessage});
}

class FetchBooksHomeSuccessState extends HomeState {
  final List<BookModel> books;

  const FetchBooksHomeSuccessState({required this.books});
}

class FetchBookHomeListViewLoadingState extends HomeState {}

class FetchBookHomeListViewSuccessState extends HomeState {
  final List<BookModel> books;

  const FetchBookHomeListViewSuccessState({required this.books});
}

class FetchBookHomeListViewFailureState extends HomeState {
  final String errorMessage;

  const FetchBookHomeListViewFailureState({required this.errorMessage});
}
