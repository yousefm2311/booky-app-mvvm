// ignore_for_file: deprecated_member_use

import 'package:bookly_full_app_mvvm/core/errors/failures.dart';
import 'package:bookly_full_app_mvvm/core/utils/api_services.dart';
import 'package:bookly_full_app_mvvm/features/home/data/models/book_model/book_model.dart';
import 'package:bookly_full_app_mvvm/features/search/data/repos/search_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class SearchRepoImpl implements SearchRepo {
  final ApiService apiService;
  SearchRepoImpl(this.apiService);
  @override
  Future<Either<Failure, List<BookModel>>> searchBooks(
      { String? search}) async {
    try {
      var queryParameter = search != null ? '&q=$search' : '';
      var data = await apiService.getData(
        url:
            'volumes?Filtering=free-ebook$queryParameter&maxResults=40&Sorting=relevance',
      );

      List<BookModel> books = [];
      for (var item in data['items']) {
        try {
          books.add(BookModel.fromJson(item));
        } catch (e) {
          debugPrint(e.toString());
        }
      }
      return right(books);
    } catch (e) {
      if (e is DioError) {
        return left(ServerFailure.fromDioError(e));
      } else {
        return left(ServerFailure(e.toString()));
      }
    }
  }
}
