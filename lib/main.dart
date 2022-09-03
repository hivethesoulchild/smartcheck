import 'package:flutter/material.dart';
import 'package:smartcheck/models/charts.dart';
import 'package:smartcheck/models/dashboard.dart';
import 'package:smartcheck/models/login.dart';
import 'package:smartcheck/models/scanner.dart';
import 'package:smartcheck/models/timer.dart';
import 'package:smartcheck/models/user_dashboard.dart';
import 'package:smartcheck/models/welcome.dart';
import 'package:smartcheck/pages/splash_screen.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SmartCheck',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const SplashScreen(),
    );
  }
}

