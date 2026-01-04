// file: lib/firebase_options.dart
//
// This file is a template provided to fix the undefined 'DefaultFirebaseOptions' error.
// You should update the values below with your actual Firebase project configuration
// or run `flutterfire configure` to generate this file automatically.

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
    apiKey: 'AIzaSyBBIOo7c-arSKGbnkW8a9WOtNlx0uxgtPA',
    appId: '1:706947679160:web:e06d0450d99925738d454d',
    messagingSenderId: '706947679160',
    projectId: 'droosonline-4a5b7',
    authDomain: 'droosonline-4a5b7.firebaseapp.com',
    storageBucket: 'droosonline-4a5b7.firebasestorage.app',
    measurementId: 'G-T5YBLXDT2K',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCG-QzeoNljH_jPzdB5irnWYB7cr5DpiFg',
    appId: '1:706947679160:android:c45e47393edaea9b8d454d',
    messagingSenderId: '706947679160',
    projectId: 'droosonline-4a5b7',
    storageBucket: 'droosonline-4a5b7.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBt-QL1eV9uxSZktylBeCHriSpF-W5bZXM',
    appId: '1:706947679160:ios:127e3de302c0cbd48d454d',
    messagingSenderId: '706947679160',
    projectId: 'droosonline-4a5b7',
    storageBucket: 'droosonline-4a5b7.firebasestorage.app',
    iosBundleId: 'com.example.droosOnline',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBt-QL1eV9uxSZktylBeCHriSpF-W5bZXM',
    appId: '1:706947679160:ios:127e3de302c0cbd48d454d',
    messagingSenderId: '706947679160',
    projectId: 'droosonline-4a5b7',
    storageBucket: 'droosonline-4a5b7.firebasestorage.app',
    iosBundleId: 'com.example.droosOnline',
  );

  

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyBBIOo7c-arSKGbnkW8a9WOtNlx0uxgtPA',
    appId: '1:706947679160:web:c499fa18669b8f4d8d454d',
    messagingSenderId: '706947679160',
    projectId: 'droosonline-4a5b7',
    authDomain: 'droosonline-4a5b7.firebaseapp.com',
    storageBucket: 'droosonline-4a5b7.firebasestorage.app',
    measurementId: 'G-EH8VG0BMW7',
  );

}