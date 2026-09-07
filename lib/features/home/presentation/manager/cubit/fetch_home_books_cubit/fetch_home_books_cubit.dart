import 'package:bookly/core/use_case/use_case.dart';
import 'package:bookly/features/home/domain/entities/book_entity.dart';
import 'package:bookly/features/home/domain/use_cases/fetch_home_books_use_case.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'fetch_home_books_state.dart';

class FetchHomeBooksCubit extends Cubit<FetchHomeBooksState> {
  FetchHomeBooksCubit(this._homeBooksUsecase)
    : super(FetchHomeBooksInitial());
  final FetchHomeBooksUseCase _homeBooksUsecase;

  Future<void> fetchHomeBooks() async {
    emit(FetchHomeBooksLoading());
    final result = await _homeBooksUsecase.call(NoParams());
    result.fold(
      (e) => emit(FetchHomeBooksFailure(errorMessage: e.message)),
      (books) => emit(FetchHomeBooksSuccess(books: books)),
    );
  }
}
