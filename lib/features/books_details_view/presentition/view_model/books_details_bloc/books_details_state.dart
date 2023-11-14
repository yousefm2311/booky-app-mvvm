
abstract class BookDetailsState {}

class BooksDetailsInitailState extends BookDetailsState {}

class AddBookDetailsFavoriteLoadingState extends BookDetailsState {}

class AddBookDetailsFavoriteSuccessState extends BookDetailsState {}

class AddBookDetailsFavoriteFailuireState extends BookDetailsState {
  final String errorMessage;
  AddBookDetailsFavoriteFailuireState({required this.errorMessage});
}
