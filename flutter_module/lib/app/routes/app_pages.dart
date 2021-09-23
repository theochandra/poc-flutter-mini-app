import 'package:flutter_module/app/modules/home/home_binding.dart';
import 'package:flutter_module/app/modules/home/home_page.dart';
import 'package:get/get.dart';

part 'app_routes.dart';

class AppPages {
  static final pages = [
    GetPage(
      name: Routes.initial,
      page: () => HomePage(),
      binding: HomeBinding(),
    ),
  ];
}
