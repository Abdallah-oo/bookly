import 'package:bookly/core/use_case/use_case.dart';
import 'package:bookly/features/home/domain/entities/book_entity.dart';
import 'package:bookly/features/home/domain/use_cases/fetch_newest_books_use_case.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'fetch_newest_books_state.dart';

class FetchNewestBooksCubit extends Cubit<FetchNewestBooksState> {
  FetchNewestBooksCubit(this._newestBooksUsecase) : super(FetchNewestBooksInitial());
  final FetchNewestBooksUseCase _newestBooksUsecase;
   Future<void> fetchNewestBooks() async {
    emit(FetchNewestBooksLoading());
    final result = await _newestBooksUsecase.call(NoParams());
    result.fold(
      (e) => emit(FetchNewestBooksFailure(errorMessage: e.message)),
      (books) => emit(FetchNewestBooksSuccess(books: books)),
    );
  }
}
