import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:recicle_app/screens/MapScreen.dart';
import 'package:recicle_app/screens/QuestionAnswerScreen.dart';
import 'package:recicle_app/screens/mainScreen.dart';
import 'package:recicle_app/screens/materialDescriptionScreen.dart';
import 'package:recicle_app/screens/photoView.dart';
import 'package:recicle_app/screens/newMaterialDescriptionScreen.dart';
// import 'package:recicle_app/screens/onBoardingScreen.dart';

void main() => runApp(MyApp());

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
        scaffoldBackgroundColor: Color(0xFFF1F1F1),

        accentColor: Color(0xFF01995C),
        appBarTheme: AppBarTheme(elevation: 0),
      ),
      home: MainScreen(),
      routes: {
        MainScreen.routeName: (context) => MainScreen(),
        MaterialWasteScreen.routeName: (context) => MaterialWasteScreen(),
        NewMaterialWasteScreen.routeName: (context) => NewMaterialWasteScreen(),
        QuestionAnswerScreen.routeName: (context) => QuestionAnswerScreen(),
        GMapScreen.routeName: (context) => GMapScreen(),
        PhotoView.routeName: (context) => PhotoView(),
      },
    );
  }
}
