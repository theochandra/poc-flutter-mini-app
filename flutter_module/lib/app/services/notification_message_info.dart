import 'package:equatable/equatable.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'remote_message_extensions.dart';

enum NotificationProvider { firebase }

class NotificationMessageInfo extends Equatable {
  final NotificationProvider notificationProvider;
  final RemoteMessage? firebaseMessage;

  NotificationMessageInfo({
    required this.notificationProvider,
    this.firebaseMessage,
  });

  factory NotificationMessageInfo.fromMap(Map<String, dynamic> map) {
    return NotificationMessageInfo(
      notificationProvider:
          NotificationProvider.values[map['notificationProvider']],
      firebaseMessage: map['firebaseMessage'] == null
          ? null
          : RemoteMessage.fromMap(
              Map<String, dynamic>.from(map['firebaseMessage'])),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'notificationProvider': notificationProvider.index,
      'firebaseMessage': firebaseMessage?.toMap(),
    };
  }

  String? get pushNotificationType {
    if (notificationProvider == NotificationProvider.firebase) {
      return firebaseMessage!.data['type'];
    }

    throw unhandledError(notificationProvider);
  }

  static ArgumentError unhandledError(
      NotificationProvider notificationProvider) {
    return ArgumentError(
        'Unhandled notificationProvider $notificationProvider');
  }

  @override
  List<Object?> get props => [notificationProvider, firebaseMessage];
}
