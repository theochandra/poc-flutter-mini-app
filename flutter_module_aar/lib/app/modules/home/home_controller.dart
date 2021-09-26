import 'package:dio/dio.dart';
import 'package:flutter_module_aar/app/data/model/post.dart';
import 'package:flutter_module_aar/app/data/model/post_model.dart';
import 'package:flutter_module_aar/app/data/repositories/local_post_repository.dart';
import 'package:flutter_module_aar/app/modules/home/home_repository.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  final HomeRepository repository;
  final LocalPostRepository postRepository;

  HomeController({
    required this.repository,
    required this.postRepository,
  });

  final _postList = [].obs;
  get postList => _postList;
  set postList(value) => _postList.value = value;

  Future<void> getAll() async {
    try {
      final data = await repository.getAll();
      postList = data;
      data.forEach((model) {
        insertPost(model);
      });
    } on DioError catch (_) {}
  }

  Future<void> insertPost(PostModel model) async {
    final post = Post(
      id: model.id,
      title: model.title,
      body: model.body,
    );
    postRepository.insertPost(post);
  }
}
