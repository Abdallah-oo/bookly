import 'package:bookly/core/network/api_error.dart';
import 'package:bookly/core/network/dio_exception.dart';
import 'package:bookly/features/home/data/data_source/home_local_data_source.dart';
import 'package:bookly/features/home/data/data_source/home_remote_data_source.dart';
import 'package:bookly/features/home/domain/entities/book_entity.dart';
import 'package:bookly/features/home/domain/repos/home_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class HomeRepoImp implements HomeRepo {
  final HomeLocalDataSource localData;
  final HomeRemoteDataSource remoteData;
  HomeRepoImp({required this.localData, required this.remoteData});
    @override
  Future<Either<ApiError, List<BookEntity>>> fetchHomeBooks({
    required int pageKey,
  }) async {
    try {
      // الكاش المحلي بيتستخدم بس في أول صفحة
      if (pageKey == 0) {
        final List<BookEntity> cachedBooks = localData.fetchHomeBooks();
        if (cachedBooks.isNotEmpty) {
          return right(cachedBooks);
        }
      }
      final List<BookEntity> remoteBooks = await remoteData.fetchHomeBooks(
        startIndex: pageKey,
      );
      return right(remoteBooks);
    } catch (e) {
      if (e is DioException) {
        return left(DioExceptions.handleError(e));
      }
      return left(ApiError(message: '$e'));
    }
  }
  @override
  Future<Either<ApiError, List<BookEntity>>> fetchHomeNewestBooks({
    required int pageKey,
  }) async {
    try {

   if (pageKey == 0) {
        final List<BookEntity> cachedBooks = localData.fetchHomeNewestBooks();
        if (cachedBooks.isNotEmpty) {
          return right(cachedBooks);
        }
      }
      final List<BookEntity> remoteBooks = await remoteData.fetchHomeNewestBooks(
        startIndex: pageKey,
      );
      return right(remoteBooks);
    } catch (e) {
      if (e is DioException) {
        return left(DioExceptions.handleError(e));
      }
      return left(ApiError(message: '$e'));
    }
  }
}
