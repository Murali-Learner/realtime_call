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
    apiKey: 'AIzaSyAjZoAGlS7nXPzI8Y18ofm0tQuUtCKJLHk',
    appId: '1:964201218662:web:d4a0de3ddd729958e123a7',
    messagingSenderId: '964201218662',
    projectId: 'realtime-call',
    authDomain: 'realtime-call.firebaseapp.com',
    databaseURL: 'https://realtime-call-default-rtdb.firebaseio.com',
    storageBucket: 'realtime-call.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyA4X3yQOM3RJHExZgGYXd1BX1zCyd_P3B4',
    appId: '1:964201218662:android:c80a7b38e172c094e123a7',
    messagingSenderId: '964201218662',
    projectId: 'realtime-call',
    databaseURL: 'https://realtime-call-default-rtdb.firebaseio.com',
    storageBucket: 'realtime-call.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDuzxmtttZJtsfKuzMSYbsiHAxqASfsHeM',
    appId: '1:964201218662:ios:241efae8689fe4aee123a7',
    messagingSenderId: '964201218662',
    projectId: 'realtime-call',
    storageBucket: 'realtime-call.appspot.com',
    iosBundleId: 'com.example.realtimeCall',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDuzxmtttZJtsfKuzMSYbsiHAxqASfsHeM',
    appId: '1:964201218662:ios:241efae8689fe4aee123a7',
    messagingSenderId: '964201218662',
    projectId: 'realtime-call',
    storageBucket: 'realtime-call.appspot.com',
    iosBundleId: 'com.example.realtimeCall',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyAjZoAGlS7nXPzI8Y18ofm0tQuUtCKJLHk',
    appId: '1:964201218662:web:9d3ee547e3dcdb2de123a7',
    messagingSenderId: '964201218662',
    projectId: 'realtime-call',
    authDomain: 'realtime-call.firebaseapp.com',
    storageBucket: 'realtime-call.appspot.com',
  );
}