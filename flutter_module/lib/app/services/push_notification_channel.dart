import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class PushNotificationChannel {
  static final announcement = AndroidNotificationChannel(
      "announcement", "Announcement", "",
      importance: Importance.high);

  static final transaction = AndroidNotificationChannel(
      "transaction", "Transaction", "",
      importance: Importance.high);

  static final removedChannel = AndroidNotificationChannel(
      'channel_ID', 'channel name', 'channel description');

  static final channelList = [announcement, transaction];
}
