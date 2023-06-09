// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:project_management/screens/auth/auth.dart';
import 'package:project_management/utils/theme/screen_size.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await Hive.initFlutter();
  await Hive.openBox<String>('users');
  await Hive.openBox<bool>('loggedIn');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenSize = getScreenSize(context);
    final double oneHeightUnit = screenSize.oneHeightUnit;
    final double oneWidthUnit = screenSize.oneWidthUnit;

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Vaccienly Dashboard',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: AuthScreen(
        height: screenSize.height,
        width: screenSize.width,
        heightUnit: oneHeightUnit,
        widthUnit: oneWidthUnit,
      ),
    );
  }
}
