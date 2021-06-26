import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:recycle_app/daos/in_memory_collect_route_dao.dart';
import 'package:recycle_app/models/collect_route_model.dart';
import 'package:recycle_app/services/collect_day_notification_service.dart';

class CollectDayNotificationController extends ChangeNotifier {
  final CollectDayNotificationService _collectDayNotificationService =
      new CollectDayNotificationService();
  Set<int> _activeCollectRouteNotificationsIdsCache;

  Future<void> scheduleNotification(CollectRoute route) async {
    await _collectDayNotificationService.scheduleNotification(route);
    this._activeCollectRouteNotificationsIdsCache.add(route.id);
    Future(this.notifyListeners);
  }

  Future<void> removeNotificationFor(int collectRouteId) async {
    await _collectDayNotificationService.deleteByCollectRouteId(collectRouteId);
    this._activeCollectRouteNotificationsIdsCache.remove(collectRouteId);
    Future(this.notifyListeners);
  }

  Future<Set<int>> getActiveCollectRouteNotificationsIds() async {
    if (this._activeCollectRouteNotificationsIdsCache != null) {
      return _activeCollectRouteNotificationsIdsCache;
    }
    return this._collectDayNotificationService.getCollectRouteIds().then((ids) {
      this._activeCollectRouteNotificationsIdsCache = ids;
      return ids;
    });
  }

  Future<List<CollectRoute>> getCollectRoutesWithActiveNotifications() async {
    Set<int> ids = await this.getActiveCollectRouteNotificationsIds();
    return InMemoryCollectRouteDao().getAllWithIds(ids);
  }

  bool hasCachedIds() {
    return _activeCollectRouteNotificationsIdsCache != null;
  }

  Set<int> get cachedActiveCollectRouteNotificationsIds {
    Set<int> ids = Set();
    ids.addAll(this._activeCollectRouteNotificationsIdsCache);
    return ids;
  }
}
