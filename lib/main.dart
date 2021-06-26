import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_config/flutter_config.dart';
import 'package:provider/provider.dart';
import 'package:recycle_app/screens/about_project.dart';
import 'package:recycle_app/controllers/collect_day_notification_controller.dart';
import 'package:recycle_app/screens/main_screen.dart';
import 'package:recycle_app/screens/map_screen/map_screen.dart';
import 'package:recycle_app/screens/material_description_screen.dart';
import 'package:recycle_app/screens/photo_view.dart';
import 'package:recycle_app/screens/question_answer_screen.dart';
import 'package:recycle_app/screens/results_screen/results_screen.dart';

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
        ChangeNotifierProvider<CollectDayNotificationController>.value(
          value: CollectDayNotificationController(),
        )
      ],
      child: MaterialApp(
        title: 'Recycle App',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          accentColor: Color(0xFF09995C),
          appBarTheme: AppBarTheme(elevation: 0),
          textTheme: TextTheme(
            headline1: TextStyle(
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w600,
              color: Colors.white,
              fontSize: 18,
            ),
            headline2: TextStyle(
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w600,
              color: Color(0xFF1E1E1E),
              fontSize: 14,
            ),
            overline: TextStyle(
              color: Colors.white,
              fontFamily: "Poppins",
              fontWeight: FontWeight.w400,
              fontSize: 12,
            ),
            subtitle1: TextStyle(
              color: Colors.white,
              fontFamily: "Poppins",
              fontWeight: FontWeight.w400,
              fontSize: 12,
            ),
            bodyText1: TextStyle(
              color: Color(0xFF1E1E1E),
              fontFamily: "Poppins",
              fontWeight: FontWeight.w400,
              fontSize: 13,
            ),
          ),
        ),
        home: MainScreen(),
        routes: {
          MainScreen.routeName: (context) => MainScreen(),
          MaterialWasteScreen.routeName: (context) => MaterialWasteScreen(),
          QuestionAnswerScreen.routeName: (context) => QuestionAnswerScreen(),
          GMapScreen.routeName: (context) => GMapScreen(),
          PhotoView.routeName: (context) => PhotoView(),
          ResultsScreen.routeName: (context) => ResultsScreen(),
          AboutProject.routeName: (context) => AboutProject(),
        },
      ),
    );
  }
}
