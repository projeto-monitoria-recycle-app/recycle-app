import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:provider/provider.dart';
import 'package:recicle_app/configs/localNotificationPluginFactory.dart';
import 'package:recicle_app/daos/collectDayNotificationDao.dart';
import 'package:recicle_app/screens/mapScreen.dart';
import 'package:recicle_app/screens/questionAnswerScreen.dart';
import 'package:recicle_app/screens/mainScreen.dart';
import 'package:recicle_app/screens/materialDescriptionScreen.dart';
import 'package:recicle_app/screens/photoView.dart';
import 'controllers/collectDayNotificationController.dart';

void main() {
  runApp(MyApp());

}


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<CollectDayNotificationController>.value(value: CollectDayNotificationController(),)
      ],
      child: MaterialApp(
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
      ),
    );
  }
}
