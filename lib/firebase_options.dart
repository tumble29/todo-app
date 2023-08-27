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
    apiKey: 'AIzaSyCnG_3E-HRD6vO8OKOgrlQZHMCfx7bv54k',
    appId: '1:365902527687:web:5b1a8c4e489f6e79c952e2',
    messagingSenderId: '365902527687',
    projectId: 'todos-9a6ba',
    authDomain: 'todos-9a6ba.firebaseapp.com',
    storageBucket: 'todos-9a6ba.appspot.com',
    measurementId: 'G-4SH4W6RV7P',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDi92CLBSpF1bT4VBbZVm_jLvYZGj-uHrE',
    appId: '1:365902527687:android:1506e1ceda060fdfc952e2',
    messagingSenderId: '365902527687',
    projectId: 'todos-9a6ba',
    storageBucket: 'todos-9a6ba.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDcYjl3s0N-xbJuXbCKxZqa2zf-Sd33wWc',
    appId: '1:365902527687:ios:dc3b433de8b1fbc0c952e2',
    messagingSenderId: '365902527687',
    projectId: 'todos-9a6ba',
    storageBucket: 'todos-9a6ba.appspot.com',
    iosClientId: '365902527687-2rs1nuibntbfmnoj5pl7mpcodfokfthh.apps.googleusercontent.com',
    iosBundleId: 'com.example.simpleTodoApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDcYjl3s0N-xbJuXbCKxZqa2zf-Sd33wWc',
    appId: '1:365902527687:ios:db273e870310b317c952e2',
    messagingSenderId: '365902527687',
    projectId: 'todos-9a6ba',
    storageBucket: 'todos-9a6ba.appspot.com',
    iosClientId: '365902527687-f0p680sjkv1dvfjmkg2oman9jomauh7r.apps.googleusercontent.com',
    iosBundleId: 'com.example.simpleTodoApp.RunnerTests',
  );
}
