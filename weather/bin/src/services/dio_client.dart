import 'package:dio/dio.dart';

import '../interfaces/http_client_interface.dart';

class DioClient implements IHttpClient {
  DioClient(this.dio);

  final Dio dio;

  @override
  Future get(String url) async {
    final response = await dio.get(url);
    return response.data;
  }
}
