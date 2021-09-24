import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_module/app/routes/app_pages.dart';
import 'package:flutter_module/app/services/push_notification.dart';
import 'package:flutter_module/app/services/push_notification_channel.dart';

import 'package:flutter_module/app/services/notification_message_info.dart';
import 'package:get/get.dart';

class PostPushNotification extends PushNotification {
  static const String TYPE = "106";
  final String? title;
  final String? body;
  final String? inboxNotificationId;
  final AndroidNotificationChannel channel =
      PushNotificationChannel.announcement;

  factory PostPushNotification.fromNotificationMessageInfo(
      NotificationMessageInfo notificationMessageInfo) {
    if (notificationMessageInfo.notificationProvider ==
        NotificationProvider.firebase) {
      final firebaseMessage = notificationMessageInfo.firebaseMessage!;

      return PostPushNotification._(
        notificationMessageInfo,
        firebaseMessage.data['notificationId'],
        firebaseMessage.notification!.title,
        firebaseMessage.notification!.body,
      );
    }

    throw NotificationMessageInfo.unhandledError(
        notificationMessageInfo.notificationProvider);
  }

  PostPushNotification._(NotificationMessageInfo notificationMessageInfo,
      this.inboxNotificationId, this.title, this.body)
      : super(notificationMessageInfo);

  @override
  void handlePushNotification(NotificationMode mode) {
    switch (mode) {
      case NotificationMode.LAUNCH:
        navigateToShowPostPage(inboxNotificationId);
        break;
      case NotificationMode.RESUME:
        navigateToShowPostPage(inboxNotificationId);
        break;
      case NotificationMode.MESSAGE:
        break;
    }
  }

  @override
  Future onSelectNotification() async {
    navigateToShowPostPage(inboxNotificationId);
  }

  void navigateToShowPostPage(String? notificationID) {
    Get.toNamed(Routes.showPost);
  }
}
