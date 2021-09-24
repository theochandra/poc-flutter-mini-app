import 'package:camera/camera.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_module/app/services/push_notification_service.dart';
import 'package:get/get.dart';

import 'app/routes/app_pages.dart';

List<CameraDescription> cameras = [];

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  PushNotificationService().init();
  cameras = await availableCameras();
  runApp(GetMaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: Routes.initial,
    getPages: AppPages.pages,
  ));
}
