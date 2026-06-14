import 'package:bookly/core/network/api_error.dart';
import 'package:bookly/features/home/domain/entities/book_entity.dart';
import 'package:dartz/dartz.dart';

abstract class HomeRepo {
  Future<Either<ApiError, List<BookEntity>>> fetchHomeBooks();
  Future<Either<ApiError, List<BookEntity>>> fetchHomeNewestBooks();
}
