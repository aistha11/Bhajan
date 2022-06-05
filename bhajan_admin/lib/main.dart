import 'package:bhajan_admin/bindings/initialBinding.dart';
import 'package:bhajan_admin/routes/routes.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import 'package:url_strategy/url_strategy.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();


  if (!kIsWeb) {
    await Firebase.initializeApp();
  } else {
    await Firebase.initializeApp(
      options: const FirebaseOptions(
        apiKey: 'AIzaSyBUeRdZSDYYVnecxZKXuTm0uyu-Z0NYF7Q',
        appId: '1:103886369530:web:5fa46bd84909cf2bb5cf43',
        messagingSenderId: '103886369530',
        projectId: 'bhajan-ai',
        authDomain: 'bhajan-ai.firebaseapp.com',
        storageBucket: 'bhajan-ai.appspot.com',
        measurementId: 'G-DB95X70VNJ',
      ),
    );
  }

  // setPathUrlStrategy();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Bhajan Admin',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      initialBinding: InitialBinding(),
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      // unknownRoute: AppPages.unknownRoute,
    );
  }
}
