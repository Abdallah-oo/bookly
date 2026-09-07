part of 'fetch_home_books_cubit.dart';

@immutable
sealed class FetchHomeBooksState {}

final class FetchHomeBooksInitial extends FetchHomeBooksState {}

final class FetchHomeBooksLoading extends FetchHomeBooksState {}

final class FetchHomeBooksSuccess extends FetchHomeBooksState {
  final List<BookEntity> books;
  FetchHomeBooksSuccess({required this.books});
}

final class FetchHomeBooksFailure extends FetchHomeBooksState {
  final String errorMessage;
  FetchHomeBooksFailure({required this.errorMessage});
}
