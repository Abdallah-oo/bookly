import 'package:bookly/core/network/api_error.dart';
import 'package:dartz/dartz.dart';

abstract class UseCase<T, Params> {
  Future<Either<ApiError, T>> call(Params params);
}


class NoParams {}
