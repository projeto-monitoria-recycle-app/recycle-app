import 'package:recycle_app/configs/dataBase.dart';
import 'package:recycle_app/models/CollectDayNotification.dart';

class CollectDayNotificationDao {
  static final String _notificationIdColumn = "notification_id";
  static final String _routeIdColumn = "route_id";
  static final String _tableName = "notification_route";

  static final String tableCreationQuery = '''CREATE TABLE $_tableName (
    $_notificationIdColumn INTEGER PRIMARY KEY AUTOINCREMENT,
    $_routeIdColumn INTEGER UNIQUE NOT NULL
   )
   ''';

  Future<void> insert(CollectDayNotification notification,
      {Future Function(int) afterInsert}) async {
    var database = await DatabaseFactory.getDatabase();
    return database.transaction<void>((txn) async {
      int id = await txn.insert(_tableName, _toMap(notification));

      if (afterInsert != null) {
        return afterInsert(id);
      }

      notification.notificationId = id;
    });
  }

  Future<List<CollectDayNotification>> getAll() async {
    var database = await DatabaseFactory.getDatabase();
    return database.query(_tableName).then((rows) {
      List<CollectDayNotification> notifications = [];
      rows.forEach((row) {
        notifications.add(_toObject(row));
      });
      return notifications;
    });
  }

  Future<Set<int>> getCollectRouteIds() async {
    var database = await DatabaseFactory.getDatabase();
    var rows = await database.query(_tableName, columns: [_routeIdColumn]);
    Set<int> routeIds = Set();
    rows.forEach((row) {
      routeIds.add(row[_routeIdColumn]);
    });
    return routeIds;
  }

  Future<int> delete(int routeId, {Function() afterDelete}) async {
    var database = await DatabaseFactory.getDatabase();
    if (afterDelete != null) {
      return database.transaction((txn) async {
        int rowsAffected = await txn.delete(_tableName,
            where: "$_routeIdColumn = ?", whereArgs: [routeId]);
        await Future(afterDelete);
        return rowsAffected;
      });
    }
    return database.delete(_tableName);
  }

  Future<CollectDayNotification> getByCollectRouteId(int id) async {
    var database = await DatabaseFactory.getDatabase();
    var rows = await database.query(_tableName,
        where: "$_routeIdColumn = ?", whereArgs: [id], limit: 1);
    return rows.length > 0 ? _toObject(rows[0]) : null;
  }

  Future<int> deleteAll({Function() afterDelete}) async {
    var database = await DatabaseFactory.getDatabase();
    if (afterDelete != null) {
      return database.transaction((txn) async {
        int rowsAffected = await txn.delete(_tableName);
        await Future(afterDelete);
        return rowsAffected;
      });
    }
    return database.delete(_tableName);
  }

  Map<String, dynamic> _toMap(CollectDayNotification collectDayNotification) {
    return {
      _routeIdColumn: collectDayNotification.routeId,
    };
  }

  CollectDayNotification _toObject(Map<String, Object> row) {
    CollectDayNotification notification = CollectDayNotification(
        row[_routeIdColumn],
        notificationId: row[_notificationIdColumn]);
    return notification;
  }
}
