import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class LocalNotificationPluginFactory{
  static FlutterLocalNotificationsPlugin _flutterLocalNotificationsPlugin;

  static Future<FlutterLocalNotificationsPlugin> buildPlugin() async{
    if(_flutterLocalNotificationsPlugin == null){
       return _initializePlugin().then((r) => _flutterLocalNotificationsPlugin);
    }

    return _flutterLocalNotificationsPlugin;
  }
  
  static AndroidInitializationSettings _getAndroidSettings(){
    return AndroidInitializationSettings('@drawable/ic_notification');
  }

  static IOSInitializationSettings _getIOSSettings(){
    return IOSInitializationSettings(
      requestSoundPermission: false,
      requestBadgePermission: false,
      requestAlertPermission: false,
      //onDidReceiveLocalNotification: onDidReceiveLocalNotification,
    );
  }

  static Future<void> _initializePlugin() async {
    _flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

    final InitializationSettings initializationSettings = InitializationSettings(
        android: _getAndroidSettings(),
        iOS: _getIOSSettings(),
    );
    await _flutterLocalNotificationsPlugin.initialize(
      initializationSettings,
      //onSelectNotification: selectNotification,
    );
  }
}
