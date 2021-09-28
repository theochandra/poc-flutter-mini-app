import 'package:flutter/material.dart';
import 'package:flutter_module/app/global_widgets/grid_button.dart';
import 'package:flutter_module/app/global_widgets/item_view.dart';
import 'package:flutter_module/app/global_widgets/loading_widget.dart';
import 'package:flutter_module/app/modules/home/home_controller.dart';
import 'package:flutter_module/app/routes/app_pages.dart';
import 'package:get/get.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
      ),
      body: Container(
        child: GetX<HomeController>(
          initState: (state) {
            Get.find<HomeController>().getAll();
          },
          builder: (_) {
            return _.postList.length < 1
                ? LoadingWidget()
                : SingleChildScrollView(
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(12, 8, 12, 0),
                          child: Row(
                            children: [
                              GridButton(
                                icon: Icon(
                                  Icons.camera_alt,
                                  color: Colors.white,
                                ),
                                callback: () => Get.toNamed(Routes.cameraPage),
                              ),
                              SizedBox(width: 12),
                              GridButton(
                                icon: Icon(
                                  Icons.location_on,
                                  color: Colors.white,
                                ),
                                callback: () =>
                                    Get.toNamed(Routes.showLocation),
                              ),
                              SizedBox(width: 12),
                              GridButton(
                                icon: Icon(
                                  Icons.book,
                                  color: Colors.white,
                                ),
                                callback: () => Get.toNamed(Routes.showPost),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 12),
                          child: Divider(),
                        ),
                        ..._.postList.map(
                          (model) => ItemView(
                            title: model.title,
                            subtitle: model.body,
                            onTap: () {},
                          ),
                        ),
                      ],
                    ),
                  );
          },
        ),
      ),
    );
  }
}
