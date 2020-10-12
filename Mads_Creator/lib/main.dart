import 'package:Mads_Creator/pages/loggedin/dashboard/home.dart';
import 'package:Mads_Creator/pages/loggedin/dashboard/settings.dart';
import 'package:Mads_Creator/pages/public/login.dart';
import 'package:Mads_Creator/pages/public/routed/signup.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:firebase/firebase.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        // When navigating to the "/" route, build the FirstScreen widget.
        '/': (context) => Stack(
              children: [
                LoginPage(),
              ],
            ),
        // When navigating to the "/second" route, build the SecondScreen widget.
        '/signup': (context) => SignUpScreen(),
      },
    );
  }
}
