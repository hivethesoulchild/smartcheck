import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:smartcheck/answer_keys/english_answerkey.dart';
import 'package:smartcheck/models/charts.dart';
import 'package:smartcheck/models/create_answerkey.dart';
import 'package:smartcheck/pages/answerkey.dart';
import 'package:smartcheck/pages/dashboard.dart';
import 'package:smartcheck/pages/login.dart';
import 'package:smartcheck/pages/scanner.dart';
import 'package:smartcheck/models/user_dashboard.dart';
import 'package:smartcheck/pages/splash_screen.dart';
import 'package:smartcheck/pages/user_access.dart';
import 'backend/backendpy.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final cameras = await availableCameras();
  runApp(MyApp(
    cameras: cameras,
  ));
}

class MyApp extends StatelessWidget {
  final List<CameraDescription> cameras;
  const MyApp({Key? key, required this.cameras}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SmartCheck',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SplashScreen(
        cameras: cameras,
      ),
    );
  }
}
