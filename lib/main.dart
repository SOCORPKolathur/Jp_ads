
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:jp_ads/Authendication/LogIn_Page.dart';
import 'package:jp_ads/Authendication/Payment_Page.dart';
import 'package:jp_ads/Landing_Screen/Landing_Screen.dart';
import 'package:jp_ads/Splash_screen/Splah_Screen.dart';
import 'package:jp_ads/firebase_options.dart';


Future<void>_firebasemesssaghandler(RemoteMessage message)async{
  await Firebase.initializeApp();
  print(message.messageId);
}

Future<void> main()  async {
  WidgetsFlutterBinding.ensureInitialized();
  FirebaseMessaging.onBackgroundMessage(_firebasemesssaghandler);
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown
  ]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Splash_screen()
    );
  }
}

