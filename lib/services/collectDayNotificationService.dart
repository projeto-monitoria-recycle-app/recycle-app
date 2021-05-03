import 'package:recicle_app/configs/localNotificationPluginFactory.dart';
import 'package:recicle_app/daos/collectDayNotificationDao.dart';
import 'package:recicle_app/helpers/dateTimeHelper.dart';
import 'package:recicle_app/models/CollectDayNotification.dart';
import 'package:recicle_app/models/collectRouteModel.dart';
import 'package:recicle_app/models/daysOfWeek.dart';
import 'package:recicle_app/models/notificationChannelDetails.dart';
import 'package:recicle_app/models/weeklyNotification.dart';
import 'package:recicle_app/services/notificationService.dart';

class CollectDayNotificationService {
  static final NotificationChannelDetails _channelDetails =
      NotificationChannelDetails("COLLECTION_DAY", "Dia de Coleta",
          "Lembretes sobre os dias de coleta seletiva");

  final CollectDayNotificationDao collectDayNotificationDao =
      CollectDayNotificationDao();

  Future<void> scheduleNotification(CollectRoute route) async {
    var notificationService = await _getNotificationService();
    var notification = new WeeklyNotification(
      "Amanhã é dia de coleta seletiva.",
      "Amanhã é dia do caminhão da coleta passar em ${route.location}",
      DateTimeHelper.dayBefore(route.dayOfWeek),
      10,
    );
    CollectDayNotification collectDayNotification = CollectDayNotification(route.id);

    return collectDayNotificationDao.insert(collectDayNotification,
        afterInsert: (id) {
      notification.id = id;
      return notificationService.scheduleWeeklyNotification(
          notification, _channelDetails);
    });
  }

  Future<int> deleteByCollectRouteId(int collectRouteId) async {
    var collectDayNotification = await collectDayNotificationDao.getByCollectRouteId(collectRouteId);
    return collectDayNotificationDao.delete(collectRouteId, afterDelete: () async {
      var notificationService = await _getNotificationService();
      return notificationService.cancelNotification(collectDayNotification.notificationId);
    });

  }

  Future<NotificationService> _getNotificationService() async {
    return NotificationService(
        await LocalNotificationPluginFactory.buildPlugin());
  }


  void clearAllNotifications() async {
    List<CollectDayNotification> notifications =
        await collectDayNotificationDao.getAll();
    collectDayNotificationDao.deleteAll(afterDelete: () async {
      NotificationService notificationService = await _getNotificationService();
      notificationService.cancelAllWeeklyNotifications(notifications.map((e) => e.notificationId).toList());
    });
  }

  Future<bool> isNotificationActiveForRoute(CollectRoute route) async {
    print("fetching notification with id ${route.id}");
    var notification =
        await collectDayNotificationDao.getByCollectRouteId(route.id);



    if(notification != null){
      print("notification fetched: ${notification.routeId}, ${notification.notificationId}");
    } else{
      print("didn't find notification with id ${route.id}");
    }
    print("notification active: ${notification != null}");
    return notification != null;
  }

  Future<Set<int>> getCollectRouteIds() async {
    return collectDayNotificationDao.getCollectRouteIds();
  }
}
