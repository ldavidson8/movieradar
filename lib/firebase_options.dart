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
    apiKey: 'AIzaSyDSgWLN2l2FRltSTwD37MxYX5L6YRTYdbs',
    appId: '1:817618672309:web:a433ca4b5c39ad2b5c7cfc',
    messagingSenderId: '817618672309',
    projectId: 'movieradar-ae903',
    authDomain: 'movieradar-ae903.firebaseapp.com',
    storageBucket: 'movieradar-ae903.appspot.com',
    measurementId: 'G-SW29CTGPH1',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCl8Ga_zgMaGHTTVkq9a-aQ4J-CaaQg6yM',
    appId: '1:817618672309:android:bde24e49561b7da55c7cfc',
    messagingSenderId: '817618672309',
    projectId: 'movieradar-ae903',
    storageBucket: 'movieradar-ae903.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCbsS9oauUmbj2p2GPLNk8Q9SQPQow_1W8',
    appId: '1:817618672309:ios:114c4679e61902995c7cfc',
    messagingSenderId: '817618672309',
    projectId: 'movieradar-ae903',
    storageBucket: 'movieradar-ae903.appspot.com',
    iosBundleId: 'com.example.movieradar',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCbsS9oauUmbj2p2GPLNk8Q9SQPQow_1W8',
    appId: '1:817618672309:ios:55ea0e0b85e205325c7cfc',
    messagingSenderId: '817618672309',
    projectId: 'movieradar-ae903',
    storageBucket: 'movieradar-ae903.appspot.com',
    iosBundleId: 'com.example.movieradar.RunnerTests',
  );
}
