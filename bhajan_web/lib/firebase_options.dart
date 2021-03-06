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
    apiKey: 'AIzaSyBUeRdZSDYYVnecxZKXuTm0uyu-Z0NYF7Q',
    appId: '1:103886369530:web:5fa46bd84909cf2bb5cf43',
    messagingSenderId: '103886369530',
    projectId: 'bhajan-ai',
    authDomain: 'bhajan-ai.firebaseapp.com',
    storageBucket: 'bhajan-ai.appspot.com',
    measurementId: 'G-DB95X70VNJ',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDvD8sDsVgyfi64eqJ5bBaXz9kJDkmqAS8',
    appId: '1:103886369530:android:0496883994ea1a55b5cf43',
    messagingSenderId: '103886369530',
    projectId: 'bhajan-ai',
    storageBucket: 'bhajan-ai.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBagO4wit-OalketnOhd7RTi_tinqyJWd4',
    appId: '1:103886369530:ios:b7070ce8d24c74ddb5cf43',
    messagingSenderId: '103886369530',
    projectId: 'bhajan-ai',
    storageBucket: 'bhajan-ai.appspot.com',
    iosClientId: '103886369530-r6dl3o3s81hf2tdtqv9405pj600gcjja.apps.googleusercontent.com',
    iosBundleId: 'com.aistha11.bhajanWeb',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBagO4wit-OalketnOhd7RTi_tinqyJWd4',
    appId: '1:103886369530:ios:b7070ce8d24c74ddb5cf43',
    messagingSenderId: '103886369530',
    projectId: 'bhajan-ai',
    storageBucket: 'bhajan-ai.appspot.com',
    iosClientId: '103886369530-r6dl3o3s81hf2tdtqv9405pj600gcjja.apps.googleusercontent.com',
    iosBundleId: 'com.aistha11.bhajanWeb',
  );
}
