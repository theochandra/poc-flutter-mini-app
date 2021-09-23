import 'package:dio/dio.dart';
import 'package:flutter_module/app/modules/home/home_repository.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  final HomeRepository repository;

  HomeController({required this.repository});

  final _postList = [].obs;
  get postList => _postList;
  set postList(value) => _postList.value = value;

  Future<void> getAll() async {
    try {
      final data = await repository.getAll();
      postList = data;
    } on DioError catch (_) {}
  }
}
