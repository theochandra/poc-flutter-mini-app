import 'package:flutter/material.dart';
import 'package:flutter_module/app/global_widgets/grid_button.dart';
import 'package:flutter_module/app/global_widgets/loading_widget.dart';
import 'package:flutter_module/app/modules/home/home_controller.dart';
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
                                callback: () {},
                              ),
                              SizedBox(width: 12),
                              GridButton(
                                icon: Icon(
                                  Icons.map,
                                  color: Colors.white,
                                ),
                                callback: () {},
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
                              onTap: () {}),
                        )
                      ],
                    ),
                  );
          },
        ),
      ),
    );
  }
}

class ItemView extends StatelessWidget {
  final String title;
  final String subtitle;
  final VoidCallback onTap;

  const ItemView({
    Key? key,
    required this.title,
    required this.subtitle,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Card(
        elevation: 3,
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                ),
              ),
              SizedBox(height: 8),
              Text(
                subtitle,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w300,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
