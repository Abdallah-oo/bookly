import 'package:bookly/core/network/api_error.dart';
import 'package:bookly/core/use_case/use_case.dart';
import 'package:bookly/features/home/domain/entities/book_entity.dart';
import 'package:bookly/features/home/domain/repos/home_repo.dart';
import 'package:dartz/dartz.dart';

class FetchHomeBooksParams {
  final int pageKey;
  const FetchHomeBooksParams({required this.pageKey});
}

class FetchHomeBooksUseCase extends UseCase<List<BookEntity>, FetchHomeBooksParams> {
  final HomeRepo _homeRepo;
  FetchHomeBooksUseCase({required HomeRepo homeRepo}) : _homeRepo = homeRepo;

  @override
  Future<Either<ApiError, List<BookEntity>>> call(FetchHomeBooksParams params) {
    return _homeRepo.fetchHomeBooks(pageKey: params.pageKey);
  }
}
