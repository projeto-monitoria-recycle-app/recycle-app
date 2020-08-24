import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:recicle_app/screens/homePage.dart';
import 'package:recicle_app/screens/on_boarding_screen.dart';

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
        primarySwatch: Colors.green,
        appBarTheme: AppBarTheme(elevation: 0),
      ),
      home: OnBoardingScreen(),
      routes: {
        '/home': (context) => HomePage(),
      },
    );
  }
}
