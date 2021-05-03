import 'package:recicle_app/models/collectRouteModel.dart';
import 'package:recicle_app/models/daysOfWeek.dart';
import 'package:recicle_app/models/weeklyNotification.dart';

class CollectDayNotification  {
  int notificationId;
  final int routeId;
  CollectDayNotification(this.routeId,{this.notificationId});

}