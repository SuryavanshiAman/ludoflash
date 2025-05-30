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
// / await Firebase.initializeApp(
// /   options: DefaultFirebaseOptions.currentPlatform,
// / );
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
    apiKey: 'AIzaSyALIyykBHe2SeQTeuicDoVKxJqYaMwgZ3A',
    appId: '1:42664568509:web:5280a74e8ca2cae98139d4',
    messagingSenderId: '42664568509',
    projectId: 'ludoflash-dad44',
    authDomain: 'ludoflash-dad44.firebaseapp.com',
    storageBucket: 'ludoflash-dad44.firebasestorage.app',
    measurementId: 'G-L6WQJ9FKV6',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAJ312DxrTw_ibynrqoOikpUz-lPQPDgA0',
    appId: '1:42664568509:android:71c20527ee1fb3a78139d4',
    messagingSenderId: '42664568509',
    projectId: 'ludoflash-dad44',
    storageBucket: 'ludoflash-dad44.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAiSkuibrhAdHjArspnBEQKASAcGh4VPUg',
    appId: '1:471366946421:ios:88e3f4caacfe64d9ab723c',
    messagingSenderId: '471366946421',
    projectId: 'roll2win-385d2',
    storageBucket: 'roll2win-385d2.firebasestorage.app',
    iosBundleId: 'com.ludo_flash.game.roll2win',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAiSkuibrhAdHjArspnBEQKASAcGh4VPUg',
    appId: '1:471366946421:ios:88e3f4caacfe64d9ab723c',
    messagingSenderId: '471366946421',
    projectId: 'roll2win-385d2',
    storageBucket: 'roll2win-385d2.firebasestorage.app',
    iosBundleId: 'com.ludo_flash.game.roll2win',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyALIyykBHe2SeQTeuicDoVKxJqYaMwgZ3A',
    appId: '1:42664568509:web:f91a589a6432874b8139d4',
    messagingSenderId: '42664568509',
    projectId: 'ludoflash-dad44',
    authDomain: 'ludoflash-dad44.firebaseapp.com',
    storageBucket: 'ludoflash-dad44.firebasestorage.app',
    measurementId: 'G-TVRS5Z6F77',
  );

}