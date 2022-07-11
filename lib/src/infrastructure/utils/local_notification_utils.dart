import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/timezone.dart' as tz;

class LocalNotificationUtil {
  final _flutterNotification = FlutterLocalNotificationsPlugin();

  Future<void> initNotification() async {
    const AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings('@mipmap/ic_launcher');

    const IOSInitializationSettings initializationSettingsIOS =
        IOSInitializationSettings(
      requestAlertPermission: false,
      requestBadgePermission: false,
      requestSoundPermission: false,
    );

    const InitializationSettings initializationSettings =
        InitializationSettings(
            android: initializationSettingsAndroid,
            iOS: initializationSettingsIOS);

    await _flutterNotification.initialize(initializationSettings);
  }

  Future<void> showNotification(
      {String? id,
      required String body,
      required tz.TZDateTime dateTime}) async {
    await _flutterNotification.zonedSchedule(
      int.parse(id ?? "0"),
      "Deadline Task",
      body,
      dateTime.add(const Duration(seconds: 1)),
      const NotificationDetails(
        android: AndroidNotificationDetails('doit', 'DoIt',
            channelDescription: "Task Planner",
            importance: Importance.max,
            priority: Priority.max),
        iOS: IOSNotificationDetails(
          sound: 'default.wav',
          presentAlert: true,
          presentBadge: true,
          presentSound: true,
        ),
      ),
      uiLocalNotificationDateInterpretation:
          UILocalNotificationDateInterpretation.absoluteTime,
      androidAllowWhileIdle: true,
    );
  }

  Future<void> removeNotification(int notificationId) async {
    await _flutterNotification.cancel(notificationId);
  }
}
