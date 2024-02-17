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
        return macos;
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
    apiKey: 'AIzaSyA4AF4AvMkP19rX9zLq8fDVZV7VxFLWU-k',
    appId: '1:642386240333:web:6f6dd8d3776afb19d64d04',
    messagingSenderId: '642386240333',
    projectId: 'fir-kotlin-111e4',
    authDomain: 'fir-kotlin-111e4.firebaseapp.com',
    databaseURL: 'https://fir-kotlin-111e4-default-rtdb.asia-southeast1.firebasedatabase.app',
    storageBucket: 'fir-kotlin-111e4.appspot.com',
    measurementId: 'G-0V1MCK7F0K',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyATf7u64jgqxOPkBe2Yq4-DOnR1jzEzvzw',
    appId: '1:642386240333:android:6bb31639ebd58377d64d04',
    messagingSenderId: '642386240333',
    projectId: 'fir-kotlin-111e4',
    databaseURL: 'https://fir-kotlin-111e4-default-rtdb.asia-southeast1.firebasedatabase.app',
    storageBucket: 'fir-kotlin-111e4.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBHaCrKcf-PVHzpbAZ6S_YGNZfNY0SXTII',
    appId: '1:642386240333:ios:c8639476a09b959fd64d04',
    messagingSenderId: '642386240333',
    projectId: 'fir-kotlin-111e4',
    databaseURL: 'https://fir-kotlin-111e4-default-rtdb.asia-southeast1.firebasedatabase.app',
    storageBucket: 'fir-kotlin-111e4.appspot.com',
    iosBundleId: 'com.example.baiTap4',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBHaCrKcf-PVHzpbAZ6S_YGNZfNY0SXTII',
    appId: '1:642386240333:ios:8dd93959665eed28d64d04',
    messagingSenderId: '642386240333',
    projectId: 'fir-kotlin-111e4',
    databaseURL: 'https://fir-kotlin-111e4-default-rtdb.asia-southeast1.firebasedatabase.app',
    storageBucket: 'fir-kotlin-111e4.appspot.com',
    iosBundleId: 'com.example.baiTap4.RunnerTests',
  );
}
