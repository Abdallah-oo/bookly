import 'package:bookly/core/network/dio_client.dart';
import 'package:dio/dio.dart';

class ApiService {
  final DioClient dioClient;
  ApiService(this.dioClient);

  ///get
  Future<dynamic> get({ required String endpoint,Map<String, dynamic>? queryParameters}) async {
    final response = await dioClient.dio.get(
      endpoint,
      queryParameters: queryParameters,
      options: Options(validateStatus: (status) => status != null && status < 500),
    );
    return response.data;
  }
}
