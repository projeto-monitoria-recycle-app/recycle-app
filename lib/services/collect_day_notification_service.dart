import 'package:recycle_app/configs/local_notification_plugin_factory.dart';
import 'package:recycle_app/daos/collect_day_notification_dao.dart';
import 'package:recycle_app/helpers/date_time_helper.dart';
import 'package:recycle_app/models/collect_route_model.dart';
import 'package:recycle_app/models/notification/collect_day_notification.dart';
import 'package:recycle_app/models/notification/notification_channel_details.dart';
import 'package:recycle_app/models/notification/weekly_notification.dart';
import 'package:recycle_app/services/notification_service.dart';

class CollectDayNotificationService {
  static final NotificationChannelDetails _channelDetails =
      NotificationChannelDetails("COLLECTION_DAY", "Dia de Coleta",
          "Lembretes sobre os dias de coleta seletiva");

  final CollectDayNotificationDao _collectDayNotificationDao =
      CollectDayNotificationDao();

  Future<void> scheduleNotification(CollectRoute route) async {
    var notificationService = await _getNotificationService();
    var notification = new WeeklyNotification(
      "Amanhã é dia de coleta seletiva.",
      "${route.location}",
      DateTimeHelper.dayBefore(route.dayOfWeek),
      10,
    );
    CollectDayNotification collectDayNotification =
        CollectDayNotification(route.id);

    return _collectDayNotificationDao.insert(collectDayNotification,
        afterInsert: (id) {
      notification.id = id;
      return notificationService.scheduleWeeklyNotification(
          notification, _channelDetails);
    });
  }

  Future<void> deleteByCollectRouteId(int collectRouteId) async {
    var collectDayNotification =
        await _collectDayNotificationDao.getByCollectRouteId(collectRouteId);
    return _collectDayNotificationDao.delete(collectRouteId,
        afterDelete: () async {
      var notificationService = await _getNotificationService();
      return notificationService
          .cancelNotification(collectDayNotification.notificationId);
    });
  }

  Future<NotificationService> _getNotificationService() async {
    return NotificationService(
        await LocalNotificationPluginFactory.buildPlugin());
  }

  void clearAllNotifications() async {
    List<CollectDayNotification> notifications =
        await _collectDayNotificationDao.getAll();
    _collectDayNotificationDao.deleteAll(afterDelete: () async {
      NotificationService notificationService = await _getNotificationService();
      notificationService.cancelAllWeeklyNotifications(
          notifications.map((e) => e.notificationId).toList());
    });
  }

  Future<bool> isNotificationActiveForRoute(CollectRoute route) async {
    var notification =
        await _collectDayNotificationDao.getByCollectRouteId(route.id);
    return notification != null;
  }

  Future<Set<int>> getCollectRouteIds() async {
    return _collectDayNotificationDao.getCollectRouteIds();
  }
}
