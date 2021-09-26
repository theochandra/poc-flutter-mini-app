import 'package:dio/dio.dart';
import 'package:flutter_module_aar/app/data/model/post_model.dart';
import 'package:flutter_module_aar/app/data/provider/http_factory.dart';
import 'package:retrofit/retrofit.dart';

part 'api_client.g.dart';

const baseUrl = 'https://jsonplaceholder.typicode.com';

@RestApi()
abstract class ApiClient {
  factory ApiClient.withDio() {
    return ApiClient(
      HttpFactory.factory.httpClient(),
      baseUrl: baseUrl,
    );
  }

  factory ApiClient(Dio dio, {String? baseUrl}) {
    return _ApiClient(dio, baseUrl: baseUrl);
  }

  @GET('/posts')
  Future<List<PostModel>> getAll();
}
