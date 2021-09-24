import 'dart:convert';
import 'dart:io';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_module/app/services/notification_message_info.dart';
import 'package:flutter_module/app/services/push_notification.dart';
import 'package:flutter_module/app/services/push_notification_channel.dart';

class PushNotificationService {
  PushNotificationService._();

  factory PushNotificationService() => _instance;

  static final PushNotificationService _instance = PushNotificationService._();

  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  bool _initialized = false;

  Future<void> init() async {
    if (!_initialized) {
      if (Platform.isIOS) {
        // request permission here
      }

      var initializationSettingsAndroid =
          AndroidInitializationSettings("@drawable/ic_notification");
      var initializationSettingsIOS = new IOSInitializationSettings();
      var initializationSettings = new InitializationSettings(
          android: initializationSettingsAndroid,
          iOS: initializationSettingsIOS);

      flutterLocalNotificationsPlugin.initialize(initializationSettings,
          onSelectNotification: onSelectNotification);

      // initialize android channel
      var plugin =
          flutterLocalNotificationsPlugin.resolvePlatformSpecificImplementation<
              AndroidFlutterLocalNotificationsPlugin>();
      if (plugin is AndroidFlutterLocalNotificationsPlugin) {
        createAndroidNotificationChannels(
            plugin, PushNotificationChannel.channelList);
        // remove unused channel
        plugin.deleteNotificationChannel(
            PushNotificationChannel.removedChannel.id);
      }

      String? token = await FirebaseMessaging.instance.getToken();
      print('MyTAG device token ----> $token');

      _initialized = true;

      handlePushNotificationEvents();
    }
  }

  void dispose() {
    _initialized = false;
  }

  Future onSelectNotification(String? payload) async {
    final notificationMessageInfo =
        NotificationMessageInfo.fromMap(jsonDecode(payload!));
    var pushNotification =
        PushNotification.fromNotificationMessageInfo(notificationMessageInfo);
    pushNotification.onSelectNotification();
  }

  void handlePushNotificationEvents() {
    FirebaseMessaging.instance.getInitialMessage().then((message) async {
      if (message == null) {
        return;
      }

      var pushNotification = PushNotification.fromNotificationMessageInfo(
        NotificationMessageInfo(
            notificationProvider: NotificationProvider.firebase,
            firebaseMessage: message),
      );

      pushNotification.handlePushNotification(NotificationMode.LAUNCH);
    });

    FirebaseMessaging.onMessageOpenedApp.listen((message) {
      var pushNotification = PushNotification.fromNotificationMessageInfo(
        NotificationMessageInfo(
            notificationProvider: NotificationProvider.firebase,
            firebaseMessage: message),
      );

      pushNotification.handlePushNotification(NotificationMode.RESUME);
    });

    FirebaseMessaging.onMessage.listen((message) {
      var pushNotification = PushNotification.fromNotificationMessageInfo(
        NotificationMessageInfo(
            notificationProvider: NotificationProvider.firebase,
            firebaseMessage: message),
      );

      pushNotification.handlePushNotification(NotificationMode.RESUME);
    });
  }

  void createAndroidNotificationChannels(
      AndroidFlutterLocalNotificationsPlugin plugin, channelList) {
    for (var notificationChannel in channelList) {
      plugin.createNotificationChannel(notificationChannel);
    }
  }
}
