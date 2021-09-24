import 'package:firebase_messaging/firebase_messaging.dart';

extension MapExt on RemoteMessage {
  Map<String, dynamic> toMap() {
    return {
      'senderId': senderId,
      'category': category,
      'collapseKey': collapseKey,
      'contentAvailable': contentAvailable,
      'data': data,
      'from': from,
      'messageId': messageId,
      'messageType': messageType,
      'mutableContent': mutableContent,
      'notification': notification == null
          ? null
          : {
              'title': notification?.title,
              'titleLocArgs': notification?.titleLocArgs,
              'titleLocKey': notification?.titleLocKey,
              'body': notification?.body,
              'bodyLocArgs': notification?.bodyLocArgs,
              'bodyLocKey': notification?.bodyLocKey,
              'android': notification?.android == null
                  ? null
                  : {
                      'channelId': notification!.android!.channelId,
                      'clickAction': notification!.android!.clickAction,
                      'color': notification!.android!.color,
                      'count': notification!.android!.count,
                      'imageUrl': notification!.android!.imageUrl,
                      'link': notification!.android!.link,
                      'priority': _getPriority(),
                      'smallIcon': notification!.android!.smallIcon,
                      'sound': notification!.android!.sound,
                      'ticker': notification!.android!.ticker,
                      'visibility': _getAndroidVisibility(),
                      'tag': notification!.android!.tag,
                    },
              'apple': notification?.apple == null
                  ? null
                  : {
                      'badge': notification!.apple!.badge,
                      'subtitle': notification!.apple!.subtitle,
                      'subtitleLocArgs':
                          notification!.apple!.subtitleLocArgs.isNotEmpty
                              ? notification!.apple!.subtitleLocArgs
                              : null,
                      'subtitleLocKey': notification!.apple!.subtitleLocKey,
                      'sound': notification!.apple!.sound == null
                          ? null
                          : {
                              'critical': notification!.apple!.sound?.critical,
                              'name': notification!.apple!.sound?.name,
                              'volume': notification!.apple!.sound?.volume,
                            },
                      'imageUrl': notification!.apple!.imageUrl,
                    },
            },
      'sentTime': sentTime?.millisecondsSinceEpoch,
      'threadId': threadId,
      'ttl': ttl,
    };
  }

  int? _getPriority() {
    if (notification?.android?.priority == null) return null;
    switch (notification!.android!.priority) {
      case AndroidNotificationPriority.minimumPriority:
        return -2;
      case AndroidNotificationPriority.lowPriority:
        return -1;
      case AndroidNotificationPriority.defaultPriority:
        return 0;
      case AndroidNotificationPriority.highPriority:
        return 1;
      case AndroidNotificationPriority.maximumPriority:
        return 2;
      default:
        return 0;
    }
  }

  int? _getAndroidVisibility() {
    if (notification?.android?.visibility == null) return null;

    switch (notification!.android!.visibility) {
      case AndroidNotificationVisibility.secret:
        return -1;
      case AndroidNotificationVisibility.private:
        return 0;
      case AndroidNotificationVisibility.public:
        return 1;
      default:
        return 0;
    }
  }
}
