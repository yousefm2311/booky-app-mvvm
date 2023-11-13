// ignore_for_file: deprecated_member_use
import 'package:bookly_full_app_mvvm/core/errors/failures.dart';
import 'package:bookly_full_app_mvvm/core/utils/api_services.dart';
import 'package:bookly_full_app_mvvm/features/home/data/models/book_model/book_model.dart';
import 'package:bookly_full_app_mvvm/features/home/data/repos/home_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class HomeRepoImpl implements HomeRepo {
  final ApiService apiService;
  HomeRepoImpl(this.apiService);
  @override
  Future<Either<Failure, List<BookModel>>> fetchBooks(
      {required List<String> category}) async {
    try {
      var data =
          await apiService.getData(url: 'volumes?Filtering=free-ebook&q=$category&maxResults=40&Sorting=relevance');
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

  @override
  Future<Either<Failure, List<BookModel>>> fetchListViewBooks(
      {required List<String> category}) async {
    try {
      
      var data = await apiService.getData(
          url: 'volumes?Filtering=free-ebook&q=$category&maxResults=40&Sorting=relevance');
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
