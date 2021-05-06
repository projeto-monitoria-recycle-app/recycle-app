import 'package:flutter/cupertino.dart';
import 'package:recicle_app/daos/inMemoryCollectRouteDao.dart';
import 'package:recicle_app/models/collectRouteModel.dart';
import 'package:recicle_app/services/collectDayNotificationService.dart';

class CollectDayNotificationController extends ChangeNotifier{

  final CollectDayNotificationService _collectDayNotificationService = new CollectDayNotificationService();
  Set<int> _activeCollectRouteNotificationsIdsCache;

  void _clearCache(){
    _activeCollectRouteNotificationsIdsCache = null;
  }

  Future<void> scheduleNotification(CollectRoute route) async {
    await _collectDayNotificationService.scheduleNotification(route);
    this._activeCollectRouteNotificationsIdsCache.add(route.id);
    this.notifyListeners();
  }

  Future<void> removeNotificationFor(int collectRouteId) async{
    await _collectDayNotificationService.deleteByCollectRouteId(collectRouteId);
    this._activeCollectRouteNotificationsIdsCache.remove(collectRouteId);
    this.notifyListeners();
  }

  Future<Set<int>> getActiveCollectRouteNotificationsIds() async{
    if(this._activeCollectRouteNotificationsIdsCache != null){
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
}