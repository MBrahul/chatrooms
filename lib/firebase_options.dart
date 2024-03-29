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
    apiKey: 'AIzaSyDG-8ZTF_0nz25Yjru9k808bJCMYVzVPm8',
    appId: '1:942335962386:web:749fea3af5be9e08b757cb',
    messagingSenderId: '942335962386',
    projectId: 'chatrooms-e29fc',
    authDomain: 'chatrooms-e29fc.firebaseapp.com',
    storageBucket: 'chatrooms-e29fc.appspot.com',
    measurementId: 'G-Z55W689VML',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCDnapABy01RooqIFWN0BMcc8i5EWY4e9g',
    appId: '1:942335962386:android:8d3da45b1fb18c8fb757cb',
    messagingSenderId: '942335962386',
    projectId: 'chatrooms-e29fc',
    storageBucket: 'chatrooms-e29fc.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCoRYVHeBtWteeeE_hFyf5h-m9Kl0SOHBo',
    appId: '1:942335962386:ios:de3b87f59634a5dab757cb',
    messagingSenderId: '942335962386',
    projectId: 'chatrooms-e29fc',
    storageBucket: 'chatrooms-e29fc.appspot.com',
    iosClientId: '942335962386-bud315ttintgt3bilfkfhvgks4kck6sl.apps.googleusercontent.com',
    iosBundleId: 'com.example.chatrooms',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCoRYVHeBtWteeeE_hFyf5h-m9Kl0SOHBo',
    appId: '1:942335962386:ios:de3b87f59634a5dab757cb',
    messagingSenderId: '942335962386',
    projectId: 'chatrooms-e29fc',
    storageBucket: 'chatrooms-e29fc.appspot.com',
    iosClientId: '942335962386-bud315ttintgt3bilfkfhvgks4kck6sl.apps.googleusercontent.com',
    iosBundleId: 'com.example.chatrooms',
  );
}
