
import 'package:bookly_full_app_mvvm/features/home/data/models/book_model/book_model.dart';

abstract class BooksDetailsEvent {}

class AddBookDetailsFavoriteEvent extends BooksDetailsEvent {
  final BookModel bookModel;

  AddBookDetailsFavoriteEvent({required this.bookModel});
}
