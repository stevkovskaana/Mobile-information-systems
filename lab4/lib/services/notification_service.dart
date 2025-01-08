import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class NotificationService {
  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;

  NotificationService(this.flutterLocalNotificationsPlugin);

  Future<void> initialize() async {
    const androidSettings =
        AndroidInitializationSettings('@mipmap/ic_launcher');
    const initializationSettings =
        InitializationSettings(android: androidSettings);
    await flutterLocalNotificationsPlugin.initialize(initializationSettings);
  }

  Future<void> showNotification() async {
    const androidDetails = AndroidNotificationDetails(
      'exam_channel',
      'Exam Notifications',
      channelDescription:
          'Notifies students when they are near an exam location.',
      importance: Importance.high,
      priority: Priority.high,
    );

    const notificationDetails = NotificationDetails(android: androidDetails);

    await flutterLocalNotificationsPlugin.show(
      0,
      'Nearby Exam Alert!',
      'Your location is within 500 meters of the exam location.',
      notificationDetails,
    );
  }
}
