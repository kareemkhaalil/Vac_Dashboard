import 'package:flutter/material.dart';
import 'package:bloc/bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:project_management/bloc/bloc_obs.dart';
import 'package:project_management/models/admins_model.dart';
import 'package:project_management/screens/auth/auth.dart';
import 'package:project_management/screens/home.dart';
import 'package:project_management/utils/hive/hive_manager.dart';
import 'package:project_management/widgets/scrolling.dart';

import 'firebase_options.dart';
import 'services/database_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await Hive.initFlutter();
  await Hive.openBox<String>('users');
  await Hive.openBox<bool>('loggedIn');
  Bloc.observer = MyBlocObserver();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Perform any asynchronous operations outside the build method
    final String? userId = HiveManager.getUserId();
    final bool? isLoggedIn = HiveManager.getIsLoggedIn();
    Future<AdminModel> getAdminModel() async {
      if (isLoggedIn == true && userId != null) {
        final adminData = await DatabaseService().getUserData(userId);
        debugPrint(adminData['email']);

        return AdminModel(
          id: adminData.id,
          userName: adminData['userName'],
          email: adminData['email'],
          password: adminData['password'],
        );
      } else {
        // Return a default AdminModel or handle the case when the user is not logged in
        return AdminModel();
      }
    }

    return FutureBuilder<AdminModel>(
      future: getAdminModel(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          // Show a loading indicator while fetching data
          return const CircularProgressIndicator();
        } else if (snapshot.hasError) {
          // Handle any errors that occurred during data fetching
          return Text('Error: ${snapshot.error}');
        } else {
          // Data has been successfully fetched, use it to build the app
          final adminModel = snapshot.data;
          return MaterialApp(
            scrollBehavior: MyCustomScrollBehavior(),
            debugShowCheckedModeBanner: false,
            title: 'Vaccienly Dashboard',
            theme: ThemeData(
              primarySwatch: Colors.blue,
            ),
            home: isLoggedIn == true
                ? HomeScreen(adminModel: adminModel!)
                : const AuthScreen(),
          );
        }
      },
    );
  }
}
