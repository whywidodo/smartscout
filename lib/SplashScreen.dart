import 'dart:async';
import 'package:flutter/material.dart';
import 'package:smartscout/Layout/Homepage.dart';
import 'package:smartscout/Login.dart';
import 'package:smartscout/Registrasi.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  void initState(){
    super.initState();
    splashscreenStart();
  }
  splashscreenStart() async {
    var duration = const Duration(seconds: 5);
    return Timer (duration, (){
      Navigator.pop(context);
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Homepage()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                "assets/images/smartscout.png",
                width: 150,
                height: 150,
              ),
              // Text("SmartScout",style: TextStyle(fontFamily: 'PoppinsBlack',color: Color (0xFF6A2B84)))
            ],
          )
      ),
    );
  }
}
