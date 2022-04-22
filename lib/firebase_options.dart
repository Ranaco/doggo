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
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyApnr_vWkOoRXlel5DNa0YTB2JNY7M1q5c',
    appId: '1:979252406359:web:4344cf9203b87751bf9b12',
    messagingSenderId: '979252406359',
    projectId: 'doggo-save',
    authDomain: 'doggo-save.firebaseapp.com',
    storageBucket: 'doggo-save.appspot.com',
    measurementId: 'G-P9WQ18ZRE9',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyC1b0s7spTi-OFHOgeMdGdZl9o_pnzpkgM',
    appId: '1:979252406359:android:c42ce8a2f910a20ebf9b12',
    messagingSenderId: '979252406359',
    projectId: 'doggo-save',
    storageBucket: 'doggo-save.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCnVzs0ags8heyd2811aih8x6Pt0wBdLk4',
    appId: '1:979252406359:ios:85e1309f5c03d6aabf9b12',
    messagingSenderId: '979252406359',
    projectId: 'doggo-save',
    storageBucket: 'doggo-save.appspot.com',
    iosClientId: '979252406359-i5m5ae4n6i9mnk845u0nrh0ra235sonq.apps.googleusercontent.com',
    iosBundleId: 'com.ranaco.doggo',
  );
}