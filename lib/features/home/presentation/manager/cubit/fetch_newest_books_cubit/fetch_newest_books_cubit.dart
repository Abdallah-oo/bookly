import 'package:bookly/features/home/domain/entities/book_entity.dart';
import 'package:bookly/features/home/domain/use_cases/fetch_newest_books_use_case.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'fetch_newest_books_state.dart';

class FetchNewestBooksCubit extends Cubit<FetchNewestBooksState> {
  FetchNewestBooksCubit(this._newestBooksUsecase) : super(FetchNewestBooksInitial());
  final FetchNewestBooksUseCase _newestBooksUsecase;
  static const int _pageSize = 10;

  final List<BookEntity> _newestBooks = [];
  int _nextPageKey = 0;
  bool _hasReachedMax = false;
  bool _isFetching = false;
  Future<void> fetchNewestBooks() async {
    _newestBooks.clear();
    _nextPageKey = 0;
    _hasReachedMax = false;
    emit(FetchNewestBooksLoading());
    await _fetchPage();
  }

  //helper Functions

  Future<void> fetchNextPage() async {
    if (_isFetching || _hasReachedMax) return;
    emit(FetchNewestBooksLoadingMore(books: List.unmodifiable(_newestBooks)));
    await _fetchPage();
  }

  Future<void> _fetchPage() async {
    _isFetching = true;
    final result = await _newestBooksUsecase.call(FetchNewestBooksParams(pageKey: _nextPageKey));
    _isFetching = false;

    result.fold(
      (error) {
        if (_newestBooks.isEmpty) {
          emit(FetchNewestBooksFailure(errorMessage: error.message));
        } else {
          emit(
            FetchNewestBooksLoadMoreFailure(
              books: List.unmodifiable(_newestBooks),
              errorMessage: error.message,
            ),
          );
        }
      },
      (newBooks) {
        if (newBooks.length < _pageSize) {
          _hasReachedMax = true;
        }
        _newestBooks.addAll(newBooks);
        _nextPageKey += newBooks.length;
        emit(
          FetchNewestBooksSuccess(
            books: List.unmodifiable(_newestBooks),
            hasReachedMax: _hasReachedMax,
          ),
        );
      },
    );
  }
}
