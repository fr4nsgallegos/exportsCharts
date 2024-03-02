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
      throw UnsupportedError(
        'DefaultFirebaseOptions have not been configured for web - '
        'you can reconfigure this by running the FlutterFire CLI again.',
      );
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

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyC5LtLCfr7hPuApgxWqPzMDoqUlVrslNXQ',
    appId: '1:511588844771:android:f5dfb229908acaa314b1d6',
    messagingSenderId: '511588844771',
    projectId: 'groupg7-487ad',
    storageBucket: 'groupg7-487ad.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDDs-Qw2bGylLH5T4Uwo6GW0KJT5d2WLvY',
    appId: '1:511588844771:ios:25c7068ed8b8b0a914b1d6',
    messagingSenderId: '511588844771',
    projectId: 'groupg7-487ad',
    storageBucket: 'groupg7-487ad.appspot.com',
    androidClientId: '511588844771-tfacf8vlh452aesnf4qg7ke687nmvhrr.apps.googleusercontent.com',
    iosClientId: '511588844771-354elg7gem98avlrpvu9ljpajlj4lk7m.apps.googleusercontent.com',
    iosBundleId: 'groupg7.com.exportsandcharts',
  );
}
