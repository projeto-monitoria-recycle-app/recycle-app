import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:recycle_app/screens/mapScreen.dart';
import 'package:recycle_app/screens/QuestionAnswerScreen.dart';
import 'package:recycle_app/screens/mainScreen.dart';
import 'package:recycle_app/screens/materialDescriptionScreen.dart';
import 'package:recycle_app/screens/photoView.dart';
import 'package:flutter_config/flutter_config.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); // Required by FlutterConfig
  await FlutterConfig.loadEnvVariables();

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
