import 'package:flutter/material.dart';
import 'intro_screen.dart';
import 'name_input_screen.dart';
import 'home_screen.dart';

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
      },
    );
  }
}
