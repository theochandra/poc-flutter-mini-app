import 'package:dio/dio.dart';

class HttpFactory {
  static HttpFactory factory = HttpFactory();

  Dio httpClient() {
    return _httpClient();
  }

  Dio _httpClient() {
    var dio = Dio();
    return dio;
  }
}
