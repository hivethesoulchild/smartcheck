import 'package:flutter/material.dart';
import 'package:smartcheck/answer_keys/english_answerkey.dart';
import 'package:smartcheck/models/charts.dart';
import 'package:smartcheck/pages/answerkey.dart';
import 'package:smartcheck/pages/dashboard.dart';
import 'package:smartcheck/pages/login.dart';
import 'package:smartcheck/pages/scanner.dart';
import 'package:smartcheck/models/timer.dart';
import 'package:smartcheck/models/user_dashboard.dart';
import 'package:smartcheck/models/welcome.dart';
import 'package:smartcheck/pages/splash_screen.dart';
import 'package:smartcheck/pages/user_access.dart';


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

