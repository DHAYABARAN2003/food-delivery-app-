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
    apiKey: 'AIzaSyBMryOPKPML1X_qBn59VjK9biTMhw3o18Y',
    appId: '1:572233328756:web:0db1c9ed080833b359c921',
    messagingSenderId: '572233328756',
    projectId: 'fooddeliveryapp-60475',
    authDomain: 'fooddeliveryapp-60475.firebaseapp.com',
    storageBucket: 'fooddeliveryapp-60475.appspot.com',
    measurementId: 'G-G5891N01XQ',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCCucNlu2RM4EAvPg1JMAy58JkUs8K6eBc',
    appId: '1:572233328756:android:aa38eca7a661467759c921',
    messagingSenderId: '572233328756',
    projectId: 'fooddeliveryapp-60475',
    storageBucket: 'fooddeliveryapp-60475.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCV-oBj1ivFk06-qAT6hlBfuUl-ytTZmsQ',
    appId: '1:572233328756:ios:6c81a593a0a0233559c921',
    messagingSenderId: '572233328756',
    projectId: 'fooddeliveryapp-60475',
    storageBucket: 'fooddeliveryapp-60475.appspot.com',
    iosBundleId: 'com.example.foodUi',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCV-oBj1ivFk06-qAT6hlBfuUl-ytTZmsQ',
    appId: '1:572233328756:ios:d283cfa5aa7df73559c921',
    messagingSenderId: '572233328756',
    projectId: 'fooddeliveryapp-60475',
    storageBucket: 'fooddeliveryapp-60475.appspot.com',
    iosBundleId: 'com.example.foodUi.RunnerTests',
  );
}
