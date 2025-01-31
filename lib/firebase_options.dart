// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
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
    apiKey: 'AIzaSyCbbap-82ld2S5nem82U4ngQM4ThqGizWk',
    appId: '1:476667007144:web:da6bfbfe8eaeb8ae74729d',
    messagingSenderId: '476667007144',
    projectId: 'tarea82',
    authDomain: 'tarea82.firebaseapp.com',
    storageBucket: 'tarea82.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDA56HI3GDt2pLqhMHSNSVDX-08cCfa_9w',
    appId: '1:476667007144:android:6bf3fb2a54bbd4e474729d',
    messagingSenderId: '476667007144',
    projectId: 'tarea82',
    storageBucket: 'tarea82.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAPLnNqZbSeAntk7E41K0HkKlg29iTVb0k',
    appId: '1:476667007144:ios:6ee4e3125e7162f774729d',
    messagingSenderId: '476667007144',
    projectId: 'tarea82',
    storageBucket: 'tarea82.appspot.com',
    iosBundleId: 'com.example.firebasePractice',
  );
}
