part of 'fetch_newest_books_cubit.dart';

@immutable
sealed class FetchNewestBooksState {}

final class FetchNewestBooksInitial extends FetchNewestBooksState {}
final class FetchNewestBooksLoading extends FetchNewestBooksState {}
final class FetchNewestBooksSuccess extends FetchNewestBooksState {
    final List<BookEntity> books;
    final bool hasReachedMax;
  FetchNewestBooksSuccess({required this.books, required this.hasReachedMax});
}

final class FetchNewestBooksLoadingMore extends FetchNewestBooksState {
  final List<BookEntity> books;
  FetchNewestBooksLoadingMore({required this.books});
}
final class FetchNewestBooksLoadMoreFailure extends FetchNewestBooksState {
  final List<BookEntity> books;
  final String errorMessage;
  FetchNewestBooksLoadMoreFailure({required this.books, required this.errorMessage});
}
final class FetchNewestBooksFailure extends FetchNewestBooksState {
    final String errorMessage;
  FetchNewestBooksFailure({required this.errorMessage});
}


