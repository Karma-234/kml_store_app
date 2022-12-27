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
    apiKey: 'AIzaSyDJfOjcmhOXspqGgji7iPOef00I9DQdXR0',
    appId: '1:839066655057:web:4c06e832b8f1c8c68cdb70',
    messagingSenderId: '839066655057',
    projectId: 'kml-store-app',
    authDomain: 'kml-store-app.firebaseapp.com',
    storageBucket: 'kml-store-app.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyB6CxMpMvirdM4vyO4m9s-ihgrHZ4w8SME',
    appId: '1:839066655057:android:05e1dcdf7ba036bc8cdb70',
    messagingSenderId: '839066655057',
    projectId: 'kml-store-app',
    storageBucket: 'kml-store-app.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDuN0c2iGwIWHUE-RjrpqJsfrE2g9hnFTg',
    appId: '1:839066655057:ios:a317a147853831698cdb70',
    messagingSenderId: '839066655057',
    projectId: 'kml-store-app',
    storageBucket: 'kml-store-app.appspot.com',
    iosClientId: '839066655057-ovqpljjelftvrmalnvis1mkmtb9ovule.apps.googleusercontent.com',
    iosBundleId: 'com.example.ecommerceApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDuN0c2iGwIWHUE-RjrpqJsfrE2g9hnFTg',
    appId: '1:839066655057:ios:a317a147853831698cdb70',
    messagingSenderId: '839066655057',
    projectId: 'kml-store-app',
    storageBucket: 'kml-store-app.appspot.com',
    iosClientId: '839066655057-ovqpljjelftvrmalnvis1mkmtb9ovule.apps.googleusercontent.com',
    iosBundleId: 'com.example.ecommerceApp',
  );
}
