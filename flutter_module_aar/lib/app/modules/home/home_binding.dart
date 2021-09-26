import 'package:flutter_module_aar/app/data/repositories/local_post_repository.dart';
import 'package:flutter_module_aar/app/modules/home/home_controller.dart';
import 'package:flutter_module_aar/app/modules/home/home_repository.dart';
import 'package:get/get.dart';

class HomeBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(() {
      return HomeController(
        repository: HomeRepository(),
        postRepository: LocalPostRepository(),
      );
    });
  }
}
