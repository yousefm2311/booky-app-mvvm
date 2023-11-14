import 'package:bookly_full_app_mvvm/features/books_details_view/data/repos/books_details_repo.dart';
import 'package:bookly_full_app_mvvm/features/books_details_view/presentition/view_model/books_details_bloc/books_details_event.dart';
import 'package:bookly_full_app_mvvm/features/books_details_view/presentition/view_model/books_details_bloc/books_details_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BookDetailsBloc extends Bloc<BooksDetailsEvent, BookDetailsState> {
  final BookDetailsRepo bookDetailsRepo;
  BookDetailsBloc(this.bookDetailsRepo) : super(BooksDetailsInitailState()) {
    on<BooksDetailsEvent>((event, emit) async {
      if (event is AddBookDetailsFavoriteEvent) {
        emit(AddBookDetailsFavoriteLoadingState());
        var result = await bookDetailsRepo.addBookDetailsFavorite(
            favoritesModel: event.bookModel);
        result.fold((failure) {
          emit(AddBookDetailsFavoriteFailuireState(
              errorMessage: failure.errorMessage));
        }, (result) {
          emit(AddBookDetailsFavoriteSuccessState());
        });
      }
    });
  }
}
