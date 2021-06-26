import 'package:recycle_app/models/days_of_week.dart';

class WeeklyNotification {
  int id;
  final String title;
  final String body;
  final DayOfWeek dayOfWeek;
  final int hour;

  WeeklyNotification(this.title, this.body, this.dayOfWeek, this.hour);
}
