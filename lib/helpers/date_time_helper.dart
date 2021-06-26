import 'package:recycle_app/models/days_of_week.dart';
import 'package:timezone/timezone.dart' as tz;

class DateTimeHelper {
  static tz.Location _currentLocation;

  static Future<tz.TZDateTime> instanceOfNextHour(int hour) async {
    var currentLocation = await getCurrentLocation();
    print(currentLocation.toString());
    final tz.TZDateTime now = tz.TZDateTime.now(currentLocation);
    tz.TZDateTime scheduledDate =
        tz.TZDateTime(tz.local, now.year, now.month, now.day, hour);
    if (scheduledDate.isBefore(now)) {
      scheduledDate = scheduledDate.add(const Duration(days: 1));
    }
    return scheduledDate;
  }

  static Future<tz.Location> getCurrentLocation() async {
    return tz.getLocation("America/Sao_Paulo");
  }

  static Future<tz.TZDateTime> instanceOfNextDayOfWeek(
      DayOfWeek day, int hour) async {
    tz.TZDateTime dayOfWeekDate = await instanceOfNextHour(hour);
    while (dayOfWeekDate.weekday != day.intValue) {
      dayOfWeekDate = dayOfWeekDate.add(const Duration(days: 1));
    }
    print(dayOfWeekDate);
    return dayOfWeekDate;
  }

  static DayOfWeek dayBefore(DayOfWeek day) {
    return DayOfWeek.values[day.index - 1 % DayOfWeek.values.length];
  }
}
