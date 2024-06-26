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
    apiKey: 'AIzaSyDmPjqlSA91AT9R3_jj5qTKb6Fzpd3V_TY',
    appId: '1:773411569312:web:a87f200e5558f5c0a193c5',
    messagingSenderId: '773411569312',
    projectId: 'projectppb-1d1cf',
    authDomain: 'projectppb-1d1cf.firebaseapp.com',
    storageBucket: 'projectppb-1d1cf.appspot.com',
    measurementId: 'G-NFDYD0TNC7',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDa1vhMCHeltB5cJzDlXKCsO2q2SRrCGBU',
    appId: '1:773411569312:android:599201278b8964a0a193c5',
    messagingSenderId: '773411569312',
    projectId: 'projectppb-1d1cf',
    storageBucket: 'projectppb-1d1cf.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCGx7y0Na-3IyxZFNMb4U247v-ROFJeWU4',
    appId: '1:773411569312:ios:412c5d130adcf002a193c5',
    messagingSenderId: '773411569312',
    projectId: 'projectppb-1d1cf',
    storageBucket: 'projectppb-1d1cf.appspot.com',
    iosBundleId: 'com.example.appfirebase',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCGx7y0Na-3IyxZFNMb4U247v-ROFJeWU4',
    appId: '1:773411569312:ios:412c5d130adcf002a193c5',
    messagingSenderId: '773411569312',
    projectId: 'projectppb-1d1cf',
    storageBucket: 'projectppb-1d1cf.appspot.com',
    iosBundleId: 'com.example.appfirebase',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyDmPjqlSA91AT9R3_jj5qTKb6Fzpd3V_TY',
    appId: '1:773411569312:web:d7a4a4ec3940520fa193c5',
    messagingSenderId: '773411569312',
    projectId: 'projectppb-1d1cf',
    authDomain: 'projectppb-1d1cf.firebaseapp.com',
    storageBucket: 'projectppb-1d1cf.appspot.com',
    measurementId: 'G-FGED9G2SKW',
  );
}
