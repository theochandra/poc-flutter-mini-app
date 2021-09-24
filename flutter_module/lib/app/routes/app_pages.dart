import 'package:flutter_module/app/modules/camera/camera_page.dart';
import 'package:flutter_module/app/modules/home/home_binding.dart';
import 'package:flutter_module/app/modules/home/home_page.dart';
import 'package:flutter_module/app/modules/location/show_location_page.dart';
import 'package:flutter_module/app/modules/show_post/show_post_binding.dart';
import 'package:flutter_module/app/modules/show_post/show_post_page.dart';
import 'package:get/get.dart';

part 'app_routes.dart';

class AppPages {
  static final pages = [
    GetPage(
      name: Routes.initial,
      page: () => HomePage(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: Routes.showPost,
      page: () => ShowPostPage(),
      binding: ShowPostBinding(),
    ),
    GetPage(
      name: Routes.cameraPage,
      page: () => CameraPage(),
    ),
    GetPage(
      name: Routes.showLocation,
      page: () => ShowLocationPage(),
    ),
  ];
}
