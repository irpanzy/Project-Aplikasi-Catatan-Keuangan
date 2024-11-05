import 'package:flutter/material.dart';
import 'SplashScreen/intro_screen.dart';
import 'SplashScreen/name_input_screen.dart';
import 'Features/home_screen.dart';
import 'Features/history_screen.dart';
import 'Features/statistik_screen.dart';

void main() {
  runApp(SaveMoneyApp());
}

class SaveMoneyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SaveMoney',
      theme: ThemeData(
        primarySwatch: Colors.lime,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => IntroScreen(),
        '/name_input': (context) => NameInputScreen(),
        '/home': (context) => HomeScreen(),
        '/history': (context) => HistoryScreen(),
        '/statistik': (context) => StatistikScreen(),
      },
    );
  }
}
