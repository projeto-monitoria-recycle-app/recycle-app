import 'package:path/path.dart';
import 'package:recycle_app/daos/collect_day_notification_dao.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseFactory {
  static Future<Database> getDatabase() async {
    var databasesPath = await getDatabasesPath();
    String path = join(databasesPath, 'recicla_tere.db');
    return await openDatabase(path, version: 1,
        onCreate: (Database db, int version) async {
      // When creating the db, create the table
      await db.execute(CollectDayNotificationDao.tableCreationQuery);
    }, onDowngrade: onDatabaseDowngradeDelete);
  }
}
