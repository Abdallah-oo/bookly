import 'package:bookly/core/constants/api_endpoints.dart';
import 'package:bookly/core/network/api_services.dart';
import 'package:bookly/core/services/hive/hive_services.dart';
import 'package:bookly/features/home/data/models/book_model/book_model.dart';
import 'package:bookly/features/home/domain/entities/book_entity.dart';

abstract interface class HomeRemoteDataSource {
  Future<List<BookEntity>> fetchHomeBooks();
  Future<List<BookEntity>> fetchHomeNewestBooks();
}

class HomeBooksRemoteDataSourceImpl implements HomeRemoteDataSource {
  final ApiService _apiService;

  HomeBooksRemoteDataSourceImpl(this._apiService);

  @override
  Future<List<BookEntity>> fetchHomeBooks({int startIndex = 0, int maxResults = 40}) async {
    final response = await _apiService.get(
      endpoint: ApiEndpoints.volumes,
      queryParameters: {
        'q': 'subject:programming',
        'maxResults': maxResults,
        'startIndex': startIndex,
      },
    );
    final List<BookEntity> books = fetchBooks(response);
    HiveService.saveHomeBooks(books);
    return books;
  }

  @override
  Future<List<BookEntity>> fetchHomeNewestBooks({int startIndex = 0, int maxResults = 40}) async {
    final response = await _apiService.get(
      endpoint: ApiEndpoints.volumes,
      queryParameters: {
        'q': 'subject:fiction',
        'orderBy': 'newest',
        'maxResults': maxResults,
        'startIndex': startIndex,
      },
    );
    final List<BookEntity> books = fetchBooks(response);
    HiveService.saveNewestBooks(books);
    return books;
  }
}

//helper function
List<BookEntity> fetchBooks(dynamic response) {
  List listOfBooks = response['items'];
  final List<BookEntity> books = listOfBooks.map((m) => BookModel.fromJson(m)).toList();
  return books;
}
