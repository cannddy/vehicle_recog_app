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
    apiKey: 'AIzaSyA5S_uraK3FL2vN1shLYF_DZU3QcM_0qYQ',
    appId: '1:540925219252:web:07f15dcb75f85e5852e2e1',
    messagingSenderId: '540925219252',
    projectId: 'vehiclerecog-3d604',
    authDomain: 'vehiclerecog-3d604.firebaseapp.com',
    storageBucket: 'vehiclerecog-3d604.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAnVpHIv1Ksi4NVmIaRCtGBlCfGTrb9nFE',
    appId: '1:540925219252:android:1c70cb4789462fdf52e2e1',
    messagingSenderId: '540925219252',
    projectId: 'vehiclerecog-3d604',
    storageBucket: 'vehiclerecog-3d604.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBWC4n3yub9JNwWBlk8-chcnwAhwtwsL28',
    appId: '1:540925219252:ios:9259bd885f0cf26b52e2e1',
    messagingSenderId: '540925219252',
    projectId: 'vehiclerecog-3d604',
    storageBucket: 'vehiclerecog-3d604.appspot.com',
    iosBundleId: 'com.example.vehiclerecog',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBWC4n3yub9JNwWBlk8-chcnwAhwtwsL28',
    appId: '1:540925219252:ios:1c43bff74ec6308c52e2e1',
    messagingSenderId: '540925219252',
    projectId: 'vehiclerecog-3d604',
    storageBucket: 'vehiclerecog-3d604.appspot.com',
    iosBundleId: 'com.example.vehiclerecog.RunnerTests',
  );
}
