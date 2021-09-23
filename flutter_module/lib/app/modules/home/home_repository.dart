import 'package:flutter_module/app/data/model/post_model.dart';
import 'package:flutter_module/app/data/provider/api_client.dart';

class HomeRepository {
  late ApiClient _apiClient = ApiClient.withDio();

  Future<List<PostModel>> getAll() async {
    return _apiClient.getAll();
  }

  Future<void> insertPost() async {}
}
