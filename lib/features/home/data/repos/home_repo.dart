import 'package:bookly_full_app_mvvm/core/errors/failures.dart';
import 'package:bookly_full_app_mvvm/features/home/data/models/book_model/book_model.dart';
import 'package:dartz/dartz.dart';

abstract class HomeRepo {
  Future<Either<Failure, List<BookModel>>> fetchBooks({required List<String> category});
  Future<Either<Failure, List<BookModel>>> fetchListViewBooks({required List<String> category});
}
