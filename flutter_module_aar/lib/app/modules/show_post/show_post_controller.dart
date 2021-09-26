import 'dart:developer';

import 'package:flutter_module_aar/app/data/repositories/local_post_repository.dart';
import 'package:get/get.dart';

class ShowPostController extends GetxController {
  final LocalPostRepository postRepository;

  ShowPostController({required this.postRepository});

  final _postList = [].obs;
  get postList => _postList;
  set postList(value) => _postList.value = value;

  Future<void> getAllPosts() async {
    try {
      final data = await postRepository.getAllPosts();
      postList = data;
    } catch (error) {
      log(error.toString());
    }
  }
}
