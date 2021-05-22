
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_native_timezone/flutter_native_timezone.dart';
import 'package:recicle_app/helpers/dateTimeHelper.dart';
import 'package:recicle_app/models/daysOfWeek.dart';
import 'package:recicle_app/models/notificationChannelDetails.dart';
import 'package:recicle_app/models/weeklyNotification.dart';
import 'package:timezone/timezone.dart' as tz;
import 'package:timezone/data/latest.dart' as tz;

class NotificationService {
  final FlutterLocalNotificationsPlugin _flutterLocalNotificationsPlugin;

  NotificationService(this._flutterLocalNotificationsPlugin){
    tz.initializeTimeZones();
  }

  Future<void> scheduleWeeklyNotification(WeeklyNotification notification,
      NotificationChannelDetails channelDetails) async {
    AndroidNotificationDetails androidPlatformChannelSpecifics =
        AndroidNotificationDetails(channelDetails.channelId,
            channelDetails.channelName, channelDetails.channelDescription);

    await _flutterLocalNotificationsPlugin.zonedSchedule(
        notification.id,
        notification.title,
        notification.body,
        await DateTimeHelper.instanceOfNextDayOfWeek(notification.dayOfWeek, notification.hour),
        NotificationDetails(
          android: androidPlatformChannelSpecifics,
        ),
        androidAllowWhileIdle: true,
        uiLocalNotificationDateInterpretation:
            UILocalNotificationDateInterpretation.absoluteTime,
        matchDateTimeComponents: DateTimeComponents.dayOfWeekAndTime);
  }

  Future<void> cancelAllNotifications(){
    return _flutterLocalNotificationsPlugin.cancelAll();
  }

  Future<void> cancelNotification(int id){
    return _flutterLocalNotificationsPlugin.cancel(id);
  }

  void cancelAllWeeklyNotifications(List<int> weeklyNotificationsIds) {
    weeklyNotificationsIds.forEach((notificationId) {
      _flutterLocalNotificationsPlugin.cancel(notificationId);
    });
  }

  Future<bool> showNotification() async {
    const AndroidNotificationDetails androidPlatformChannelSpecifics =
        AndroidNotificationDetails('COLLECT_DAY', 'Dia de coleta',
            'Notificações relacionadas aos dias de coleta seletiva',
            importance: Importance.max,
            priority: Priority.high,
            showWhen: false);
    const NotificationDetails platformChannelSpecifics =
        NotificationDetails(android: androidPlatformChannelSpecifics);
    return _flutterLocalNotificationsPlugin
        .show(
      0,
      'plain title',
      'plain body',
      platformChannelSpecifics,
    )
        .then((result) {
      return true;
    }).catchError((result) {
      return false;
    });
  }
}
