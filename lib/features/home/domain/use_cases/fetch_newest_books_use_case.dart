import 'package:bookly/core/network/api_error.dart';
import 'package:bookly/core/use_case/use_case.dart';
import 'package:bookly/features/home/domain/entities/book_entity.dart';
import 'package:bookly/features/home/domain/repos/home_repo.dart';
import 'package:dartz/dartz.dart';
class FetchNewestBooksParams {
  final int pageKey;
  const FetchNewestBooksParams({required this.pageKey});
}
class FetchNewestBooksUseCase extends UseCase<List<BookEntity>, FetchNewestBooksParams> {
  final HomeRepo _homeRepo;

  FetchNewestBooksUseCase({required HomeRepo homeRepo}) : _homeRepo = homeRepo;
  @override
  Future<Either<ApiError, List<BookEntity>>> call(FetchNewestBooksParams params) {
    return _homeRepo.fetchHomeNewestBooks(pageKey: params.pageKey);
  }
}
