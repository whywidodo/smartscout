import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:smartscout/SplashScreen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: "AIzaSyAMlQdIIX4-kEpdxfS1SrDE6Ym0OL-d7l4",
      appId: "1:572729558757:android:06a0417796fa9e1629f60c",
      messagingSenderId: "572729558757",
      projectId: "smartscout-iitc",
    ),
  );

  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'Smart Scout',
    home: SplashScreen(),
  ));
}
