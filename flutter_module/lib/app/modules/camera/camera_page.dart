import 'package:flutter/material.dart';
import 'package:flutter_module/app/modules/camera/camera_screen.dart';
import 'package:flutter_module/main.dart';

class CameraPage extends StatelessWidget {
  const CameraPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Camera Page',
      home: CameraScreen(cameras: cameras),
    );
  }
}
