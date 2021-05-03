import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:recicle_app/configs/localNotificationPluginFactory.dart';
import 'package:recicle_app/daos/collectDayNotificationDao.dart';
import 'package:recicle_app/screens/mapScreen.dart';
import 'package:recicle_app/screens/questionAnswerScreen.dart';
import 'package:recicle_app/screens/mainScreen.dart';
import 'package:recicle_app/screens/materialDescriptionScreen.dart';
import 'package:recicle_app/screens/photoView.dart';
import 'package:recicle_app/services/collectDayNotificationService.dart';
import 'package:recicle_app/services/notificationService.dart';
import 'package:timezone/timezone.dart' as tz;
import 'package:timezone/data/latest.dart' as tz;
// import 'package:recicle_app/screens/onBoardingScreen.dart';

void main() {
  runApp(MyApp());
  CollectDayNotificationService().clearAllNotifications();
  LocalNotificationPluginFactory.buildPlugin().then((plugin) {
    plugin.cancelAll();
  });


  // CollectDayNotificationDao().getAll();

}


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return MaterialApp(
      title: 'Recicle App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // primarySwatch: Colors.green,
        accentColor: Color(0xFF09995C),
        appBarTheme: AppBarTheme(elevation: 0),
      ),
      home: MainScreen(),
      routes: {
        MainScreen.routeName: (context) => MainScreen(),
        MaterialWasteScreen.routeName: (context) => MaterialWasteScreen(),
        QuestionAnswerScreen.routeName: (context) => QuestionAnswerScreen(),
        GMapScreen.routeName: (context) => GMapScreen(),
        PhotoView.routeName: (context) => PhotoView(),
      },
    );
  }
}
