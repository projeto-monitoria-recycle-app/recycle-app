import 'package:flutter/material.dart';
import 'package:recicle_app/screens/on_boarding_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Recicle App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        appBarTheme: AppBarTheme(elevation: 0),
      ),
      home: OnBoardingScreen(),
    );
  }
}
