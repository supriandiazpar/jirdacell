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
    apiKey: 'AIzaSyAKqBwdvUgo-F5xwLTkXuePQ1av664VySs',
    appId: '1:711862286055:web:c2e94025f0076d03489442',
    messagingSenderId: '711862286055',
    projectId: 'jirdacell',
    authDomain: 'jirdacell.firebaseapp.com',
    storageBucket: 'jirdacell.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDoRVWDScKFwLk26w7vOwoFRokdWY_y_j4',
    appId: '1:711862286055:android:a1645e2596b51d1a489442',
    messagingSenderId: '711862286055',
    projectId: 'jirdacell',
    storageBucket: 'jirdacell.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBkeReiOk75dxvfmpiKk6Jn_vNWeFaq0iQ',
    appId: '1:711862286055:ios:de32e1e97e4c5323489442',
    messagingSenderId: '711862286055',
    projectId: 'jirdacell',
    storageBucket: 'jirdacell.appspot.com',
    iosClientId: '711862286055-9ch1a28v17ob0g5a6telhdt8e4k3f4rb.apps.googleusercontent.com',
    iosBundleId: 'com.example.jc',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBkeReiOk75dxvfmpiKk6Jn_vNWeFaq0iQ',
    appId: '1:711862286055:ios:de32e1e97e4c5323489442',
    messagingSenderId: '711862286055',
    projectId: 'jirdacell',
    storageBucket: 'jirdacell.appspot.com',
    iosClientId: '711862286055-9ch1a28v17ob0g5a6telhdt8e4k3f4rb.apps.googleusercontent.com',
    iosBundleId: 'com.example.jc',
  );
}
