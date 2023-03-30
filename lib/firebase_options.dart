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
    apiKey: 'AIzaSyCNkGHmmsn3oA4zVQE0obL6oXVniJaxlIE',
    appId: '1:432014428012:web:c52caafce4ab26d2169549',
    messagingSenderId: '432014428012',
    projectId: 'minipro-100-208',
    authDomain: 'minipro-100-208.firebaseapp.com',
    storageBucket: 'minipro-100-208.appspot.com',
    measurementId: 'G-Q5QE6FHSE8',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDXJE1AtCy9Uegh_SxK2b-PfOg1LK83WVc',
    appId: '1:432014428012:android:474f1d34b95b6190169549',
    messagingSenderId: '432014428012',
    projectId: 'minipro-100-208',
    storageBucket: 'minipro-100-208.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBKLjTf-OQ4EwvXXfOaqRquMtr0zOyqkFw',
    appId: '1:432014428012:ios:635cfe980009fbbe169549',
    messagingSenderId: '432014428012',
    projectId: 'minipro-100-208',
    storageBucket: 'minipro-100-208.appspot.com',
    iosClientId: '432014428012-mt1qjkloi96q7oaukagje1hvnrj712lf.apps.googleusercontent.com',
    iosBundleId: 'com.example.project',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBKLjTf-OQ4EwvXXfOaqRquMtr0zOyqkFw',
    appId: '1:432014428012:ios:635cfe980009fbbe169549',
    messagingSenderId: '432014428012',
    projectId: 'minipro-100-208',
    storageBucket: 'minipro-100-208.appspot.com',
    iosClientId: '432014428012-mt1qjkloi96q7oaukagje1hvnrj712lf.apps.googleusercontent.com',
    iosBundleId: 'com.example.project',
  );
}
