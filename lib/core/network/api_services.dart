import 'package:bookly/core/network/dio_client.dart';

class ApiService {
  final DioClient dioClient;
  ApiService(this.dioClient);


  ///get
  Future<dynamic> get(String endpoint) async {
    final response = await dioClient.dio.get(endpoint);
    return response.data;
  }
}
