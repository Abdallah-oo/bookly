import 'package:bookly/core/constants/api_endpoints.dart';
import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class DioClient {
  final Dio _dio = Dio(
    BaseOptions(
      baseUrl: ApiEndpoints.baseUrl,
      headers: {'Content-Type': 'application/json', 'Accept': 'application/json'},
    ),
  );
  DioClient() {
    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          options.queryParameters['key'] = dotenv.env['GOOGLE_BOOKS_API_KEY'];
          return handler.next(options);
        },
      ),
    );
  }

  Dio get dio => _dio;
}
