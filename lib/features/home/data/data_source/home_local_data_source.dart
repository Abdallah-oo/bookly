import 'package:bookly/core/services/hive/hive_services.dart';
import 'package:bookly/features/home/domain/entities/book_entity.dart';

abstract interface class HomeLocalDataSource {
  List<BookEntity> fetchHomeBooks();
  List<BookEntity> fetchHomeNewestBooks();
}

class HomeLocalDataSourceImpl implements HomeLocalDataSource {
  @override
  List<BookEntity> fetchHomeBooks() {
    return HiveService.getHomeBooks();
  }

  @override
  List<BookEntity> fetchHomeNewestBooks() {
     return HiveService.getNewestBooks();
  }
}
