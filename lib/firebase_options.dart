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
    apiKey: 'AIzaSyAphcSNZjMBSkyBcsKYqAKDwwrthCz0NSs',
    appId: '1:508712310009:web:68e36007b437ea18333e28',
    messagingSenderId: '508712310009',
    projectId: 'china-omda',
    authDomain: 'china-omda.firebaseapp.com',
    storageBucket: 'china-omda.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCxpxDM1YxOPBYkIifu4mvCC9oUv-u2MPA',
    appId: '1:508712310009:android:09c4ea8143b19860333e28',
    messagingSenderId: '508712310009',
    projectId: 'china-omda',
    storageBucket: 'china-omda.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDe3YnC0Iw3xyDkPbtzrhEi45GWbYT28zA',
    appId: '1:508712310009:ios:0133c86b45e73761333e28',
    messagingSenderId: '508712310009',
    projectId: 'china-omda',
    storageBucket: 'china-omda.appspot.com',
    iosClientId: '508712310009-c2cjt517sipkg0av6emte42agu6jqmv6.apps.googleusercontent.com',
    iosBundleId: 'com.example.chinaOmda',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDe3YnC0Iw3xyDkPbtzrhEi45GWbYT28zA',
    appId: '1:508712310009:ios:0133c86b45e73761333e28',
    messagingSenderId: '508712310009',
    projectId: 'china-omda',
    storageBucket: 'china-omda.appspot.com',
    iosClientId: '508712310009-c2cjt517sipkg0av6emte42agu6jqmv6.apps.googleusercontent.com',
    iosBundleId: 'com.example.chinaOmda',
  );
}
