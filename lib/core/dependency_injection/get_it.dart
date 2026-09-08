import 'package:bookly/core/network/api_services.dart';
import 'package:bookly/core/network/dio_client.dart';
import 'package:bookly/features/home/data/data_source/home_local_data_source.dart';
import 'package:bookly/features/home/data/data_source/home_remote_data_source.dart';
import 'package:bookly/features/home/data/repos/home_repo_impl.dart';
import 'package:bookly/features/home/domain/repos/home_repo.dart';
import 'package:bookly/features/home/domain/use_cases/fetch_home_books_use_case.dart';
import 'package:bookly/features/home/domain/use_cases/fetch_newest_books_use_case.dart';
import 'package:bookly/features/home/presentation/manager/cubit/fetch_home_books_cubit/fetch_home_books_cubit.dart';
import 'package:bookly/features/home/presentation/manager/cubit/fetch_newest_books_cubit/fetch_newest_books_cubit.dart';
import 'package:get_it/get_it.dart';

final GetIt getIt = GetIt.instance;

class GetItServiceLocator {
  static void setup() {
    // Register your services here
    getIt.registerLazySingleton<HomeRepo>(
      () => HomeRepoImp(
        localData: HomeLocalDataSourceImpl(),
        remoteData: HomeBooksRemoteDataSourceImpl(ApiService(DioClient())),
      ),
    );
    getIt.registerLazySingleton<FetchHomeBooksCubit>(
      () => FetchHomeBooksCubit(
        FetchHomeBooksUseCase(homeRepo: getIt<HomeRepo>()),
      ),
    );
    getIt.registerLazySingleton<FetchNewestBooksCubit>(
      () => FetchNewestBooksCubit(
        FetchNewestBooksUseCase(homeRepo: getIt<HomeRepo>()),
      ),
    );
  }
}
