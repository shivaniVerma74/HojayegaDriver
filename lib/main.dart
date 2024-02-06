import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:hojayegadriverapp/splashscreen.dart';

import 'Authview/GetstartedScreen.dart';
import 'Authview/loginscreen.dart';
import 'Authview/signupscreen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  try{
    String? token = await FirebaseMessaging.instance.getToken();
    print("--device------token:-----$token");
  } on FirebaseException{
    print('_____FirebaseException________');
  }
  FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
    alert: true,
    badge: true,
    sound: true,
  );
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Hojayega Driver',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: 'splash',
      routes: {
        'splash' : (context) => SplashScreen(),
        'getstarted' : (context) => GetstartedScreen(),
        'login' : (context) => LoginScreen(),
        'register' : (context) => SignupScreen(),
        // 'support' : (context) => Support(),
        // 'findPetStuff' : (context)=> FindPetStuff(),
      },
      // home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}
