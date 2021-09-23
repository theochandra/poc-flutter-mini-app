import 'package:flutter_module/app/data/model/my_model.dart';
import 'package:flutter_module/app/data/provider/api_client.dart';

class HomeRepository {
  late ApiClient _apiClient = ApiClient.withDio();

  Future<List<MyModel>> getAll() async {
    return _apiClient.getAll();
  }
}
