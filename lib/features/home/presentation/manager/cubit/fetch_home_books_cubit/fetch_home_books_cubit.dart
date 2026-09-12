import 'package:bookly/features/home/domain/entities/book_entity.dart';
import 'package:bookly/features/home/domain/use_cases/fetch_home_books_use_case.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'fetch_home_books_state.dart';

class FetchHomeBooksCubit extends Cubit<FetchHomeBooksState> {
  FetchHomeBooksCubit(this._homeBooksUsecase) : super(FetchHomeBooksInitial());
  final FetchHomeBooksUseCase _homeBooksUsecase;

  static const int _pageSize = 10;

  final List<BookEntity> _books = [];
  int _nextPageKey = 0;
  bool _hasReachedMax = false;
  bool _isFetching = false;

  /// أول تحميل (أو Refresh)
  Future<void> fetchHomeBooks() async {
    _books.clear();
    _nextPageKey = 0;
    _hasReachedMax = false;
    emit(FetchHomeBooksLoading());
    await _fetchPage();
  }

  /// جلب الصفحة اللي بعد كده
  Future<void> fetchNextPage() async {
    if (_isFetching || _hasReachedMax) return;
    emit(FetchHomeBooksLoadingMore(books: List.unmodifiable(_books)));
    await _fetchPage();
  }

  Future<void> _fetchPage() async {
    _isFetching = true;
    final result = await _homeBooksUsecase.call(
      FetchHomeBooksParams(pageKey: _nextPageKey),
    );
    _isFetching = false;

    result.fold(
      (error) {
        if (_books.isEmpty) {
          emit(FetchHomeBooksFailure(errorMessage: error.message));
        } else {
          emit(
            FetchHomeBooksLoadMoreFailure(
              books: List.unmodifiable(_books),
              errorMessage: error.message,
            ),
          );
        }
      },
      (newBooks) {
        if (newBooks.length < _pageSize) {
          _hasReachedMax = true;
        }
        _books.addAll(newBooks);
        _nextPageKey += newBooks.length;
        emit(
          FetchHomeBooksSuccess(books: List.unmodifiable(_books), hasReachedMax: _hasReachedMax),
        );
      },
    );
  }
}
