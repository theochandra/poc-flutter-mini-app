import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_module/app/services/notification_message_info.dart';
import 'package:flutter_module/app/services/post_push_notification.dart';

abstract class PushNotification {
  final NotificationMessageInfo notificationMessageInfo;

  factory PushNotification.fromNotificationMessageInfo(
      NotificationMessageInfo notificationMessageInfo) {
    try {
      String? type = notificationMessageInfo.pushNotificationType;
      switch (type) {
        case PostPushNotification.TYPE:
          return PostPushNotification.fromNotificationMessageInfo(
              notificationMessageInfo);
        default:
          return PostPushNotification.fromNotificationMessageInfo(
              notificationMessageInfo);
      }
    } catch (_) {
      return PostPushNotification.fromNotificationMessageInfo(
          notificationMessageInfo);
    }
  }

  PushNotification(this.notificationMessageInfo);

  String? get title;
  String? get body;
  AndroidNotificationChannel get channel;
  void handlePushNotification(NotificationMode mode);
  Future<dynamic> onSelectNotification();

  void showLocalNotification(
      FlutterLocalNotificationsPlugin localNotificationsPlugin) async {
    var androidPlatformChannelSpecifics = AndroidNotificationDetails(
      channel.id,
      channel.name,
      channel.description,
      importance: Importance.max,
      priority: Priority.high,
      color: Colors.blue,
    );

    var iOSChannelSpecifics = IOSNotificationDetails();
    var platformChannelSpecifics = NotificationDetails(
      android: androidPlatformChannelSpecifics,
      iOS: iOSChannelSpecifics,
    );
    var uniqueId = DateTime.now().millisecondsSinceEpoch % 0x7FFFFFFF;
    await localNotificationsPlugin.show(
      uniqueId,
      title,
      body,
      platformChannelSpecifics,
      payload: jsonEncode(notificationMessageInfo.toMap()),
    );
  }
}

enum NotificationMode {
  LAUNCH, // App is terminated
  RESUME, // App is on the backgroud
  MESSAGE, // App is on the foreground
}
