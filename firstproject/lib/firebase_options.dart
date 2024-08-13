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
        return macos;
      case TargetPlatform.windows:
        return windows;
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
    apiKey: 'AIzaSyD1p-sYWga-rJWetasvHRhMk3MUgAnH6kk',
    appId: '1:478007699240:web:ab556668e3bef979fe121d',
    messagingSenderId: '478007699240',
    projectId: 'firstproject-4b4b8',
    authDomain: 'firstproject-4b4b8.firebaseapp.com',
    storageBucket: 'firstproject-4b4b8.appspot.com',
    measurementId: 'G-26G6G432HT',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyB6sLDPAigLBDCbmF4TRS6FSskS6bZTETE',
    appId: '1:478007699240:android:4d020e774f554649fe121d',
    messagingSenderId: '478007699240',
    projectId: 'firstproject-4b4b8',
    storageBucket: 'firstproject-4b4b8.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAtxTF74nq_eOF2YP6f3maEDZUVDJFHnNE',
    appId: '1:478007699240:ios:f1df51884431b6b9fe121d',
    messagingSenderId: '478007699240',
    projectId: 'firstproject-4b4b8',
    storageBucket: 'firstproject-4b4b8.appspot.com',
    androidClientId: '478007699240-r1qqeeih8d2e4b2efr9rt8fsa7n5t6s1.apps.googleusercontent.com',
    iosClientId: '478007699240-4i4ee6dvhrunam36t6tmuhchjtti4q1j.apps.googleusercontent.com',
    iosBundleId: 'com.example.firstproject',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAtxTF74nq_eOF2YP6f3maEDZUVDJFHnNE',
    appId: '1:478007699240:ios:f1df51884431b6b9fe121d',
    messagingSenderId: '478007699240',
    projectId: 'firstproject-4b4b8',
    storageBucket: 'firstproject-4b4b8.appspot.com',
    androidClientId: '478007699240-r1qqeeih8d2e4b2efr9rt8fsa7n5t6s1.apps.googleusercontent.com',
    iosClientId: '478007699240-4i4ee6dvhrunam36t6tmuhchjtti4q1j.apps.googleusercontent.com',
    iosBundleId: 'com.example.firstproject',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyD1p-sYWga-rJWetasvHRhMk3MUgAnH6kk',
    appId: '1:478007699240:web:f6dbada7db74b685fe121d',
    messagingSenderId: '478007699240',
    projectId: 'firstproject-4b4b8',
    authDomain: 'firstproject-4b4b8.firebaseapp.com',
    storageBucket: 'firstproject-4b4b8.appspot.com',
    measurementId: 'G-MTJMS8Y50S',
  );
}
