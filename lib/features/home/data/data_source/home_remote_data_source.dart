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
  Future<List<BookEntity>> fetchHomeBooks() async {
    final response = await _apiService.get(
      endpoint: ApiEndpoints.volumes,
      queryParameters: {'q': 'subject:bestseller'},
    );
    final List<BookEntity> books = fetchBooks(response);
    HiveService.saveHomeBooks(books);
    return books;
  }

  @override
  Future<List<BookEntity>> fetchHomeNewestBooks() async {
    final response = await _apiService.get(
      endpoint: ApiEndpoints.volumes,
      queryParameters: {'q': 'subject:fiction', 'orderBy': 'newest'},
    );
    final List<BookEntity> books = fetchBooks(response);
    HiveService.saveNewestBooks(books);
    return books;
  }
}

//helper function
List<BookEntity> fetchBooks(dynamic response) {
  List<Map<String, dynamic>> listOfBooks = response['items'];
  final List<BookEntity> books = listOfBooks.map((m) => BookModel.fromJson(m)).toList();
  return books;
}
