import 'package:bookly_full_app_mvvm/constants.dart';
import 'package:bookly_full_app_mvvm/features/home/data/repos/home_repo.dart';
import 'package:bookly_full_app_mvvm/features/home/presentition/view_model/home_bloc/home_event.dart';
import 'package:bookly_full_app_mvvm/features/home/presentition/view_model/home_bloc/home_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final HomeRepo homeRepo;

  HomeBloc(this.homeRepo) : super(FetchBooksHomeInitialState()) {
    on<HomeEvent>((event, emit) async {
      var list = localStorage.getListData(key: 'bubblesSelection');

      List<String> lastThreeCategory = list.sublist(list.length - 1);
      if (event is FetchBookHomeEvent) {
        emit(FetchBooksHomeLoadingState());
        var result = await homeRepo.fetchBooks(category: list);
        result.fold(
            (failure) => emit(
                FetchBooksHomeFailureState(errorMessage: failure.errorMessage)),
            (books) => emit(FetchBooksHomeSuccessState(books: books)));
      } else if (event is FetchBookHomeListViewEvent) {
        emit(FetchBookHomeListViewLoadingState());
        var result =
            await homeRepo.fetchListViewBooks(category: lastThreeCategory);
        result.fold(
            (failure) => emit(FetchBookHomeListViewFailureState(
                errorMessage: failure.errorMessage)),
            (books) => emit(FetchBookHomeListViewSuccessState(books: books)));
      }
    });
  }
}
