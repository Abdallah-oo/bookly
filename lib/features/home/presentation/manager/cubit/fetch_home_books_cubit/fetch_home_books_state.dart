part of 'fetch_home_books_cubit.dart';

@immutable
sealed class FetchHomeBooksState {}

final class FetchHomeBooksInitial extends FetchHomeBooksState {}

final class FetchHomeBooksLoading extends FetchHomeBooksState {}

final class FetchHomeBooksSuccess extends FetchHomeBooksState {
  final List<BookEntity> books;
  final bool hasReachedMax;
  FetchHomeBooksSuccess({required this.books, required this.hasReachedMax});
}

final class FetchHomeBooksLoadingMore extends FetchHomeBooksState {
  final List<BookEntity> books;
  FetchHomeBooksLoadingMore({required this.books});
}

final class FetchHomeBooksLoadMoreFailure extends FetchHomeBooksState {
  final List<BookEntity> books;
  final String errorMessage;
  FetchHomeBooksLoadMoreFailure({required this.books, required this.errorMessage});
}

final class FetchHomeBooksFailure extends FetchHomeBooksState {
  final String errorMessage;
  FetchHomeBooksFailure({required this.errorMessage});
}
