import 'package:flutter/material.dart';
import 'package:flutter_module/app/global_widgets/info_widget.dart';
import 'package:flutter_module/app/global_widgets/item_view.dart';
import 'package:flutter_module/app/global_widgets/loading_widget.dart';
import 'package:flutter_module/app/modules/show_post/show_post_controller.dart';
import 'package:get/get.dart';

class ShowPostPage extends GetView<ShowPostController> {
  const ShowPostPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Show Post Page'),
      ),
      body: GetX<ShowPostController>(
        initState: (state) {
          Get.find<ShowPostController>().getAllPosts();
        },
        builder: (controller) {
          return controller.postList.length < 1
              ? LoadingWidget()
              : SingleChildScrollView(
                  child: Column(
                    children: [
                      InfoWidget(
                        infoMessage:
                            'This data is fetched from SQLite database.',
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12),
                        child: Divider(),
                      ),
                      ...controller.postList.map(
                        (post) => ItemView(
                          title: post.title,
                          subtitle: post.body,
                          onTap: () {},
                        ),
                      ),
                    ],
                  ),
                );
        },
      ),
    );
  }
}
