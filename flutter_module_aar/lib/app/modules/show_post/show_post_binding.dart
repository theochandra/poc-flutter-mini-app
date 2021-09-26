import 'package:flutter_module_aar/app/data/repositories/local_post_repository.dart';
import 'package:flutter_module_aar/app/modules/show_post/show_post_controller.dart';
import 'package:get/get.dart';

class ShowPostBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ShowPostController>(() {
      return ShowPostController(
        postRepository: LocalPostRepository(),
      );
    });
  }
}
