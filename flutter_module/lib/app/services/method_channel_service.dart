import 'package:flutter/services.dart';

class MethodChannelService {
  static const _methodChannelName = 'com.example.flutter_module/closeModule';
  static const _invokedMethod = 'exitFlutterModule';

  static closeFlutterModule() {
    const platform = MethodChannel(_methodChannelName);
    try {
      platform.invokeMethod(_invokedMethod);
    } on PlatformException catch (_) {}
  }
}
