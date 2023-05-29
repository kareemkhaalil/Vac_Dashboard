// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.windows:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyCi9xOJTsQfRmvQvPy8uR_jhNfftydTccY',
    appId: '1:604426396948:web:b8b531c476acfbfe858e01',
    messagingSenderId: '604426396948',
    projectId: 'vacdashboard-b7cf5',
    authDomain: 'vacdashboard-b7cf5.firebaseapp.com',
    databaseURL: 'https://vacdashboard-b7cf5-default-rtdb.europe-west1.firebasedatabase.app',
    storageBucket: 'vacdashboard-b7cf5.appspot.com',
    measurementId: 'G-G9DXVWVC0X',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBKjar0hy2sRq24cslKBO8SB6UeLc1eVTs',
    appId: '1:604426396948:android:0859549a3129e7f6858e01',
    messagingSenderId: '604426396948',
    projectId: 'vacdashboard-b7cf5',
    databaseURL: 'https://vacdashboard-b7cf5-default-rtdb.europe-west1.firebasedatabase.app',
    storageBucket: 'vacdashboard-b7cf5.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyD-Kl5JpDQIiBSm-3kuInSlS3B5P9512EQ',
    appId: '1:604426396948:ios:0775b1d3ce4c60c6858e01',
    messagingSenderId: '604426396948',
    projectId: 'vacdashboard-b7cf5',
    databaseURL: 'https://vacdashboard-b7cf5-default-rtdb.europe-west1.firebasedatabase.app',
    storageBucket: 'vacdashboard-b7cf5.appspot.com',
    iosClientId: '604426396948-o485a6hogo483na3dcq675cb1sbe80mu.apps.googleusercontent.com',
    iosBundleId: 'com.example.projectManagement',
  );
}
