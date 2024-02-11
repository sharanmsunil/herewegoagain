import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:herewegoagain/firebasedatabas/email_password_auth/home.dart';
import 'package:herewegoagain/firebasedatabas/email_password_auth/login.dart';

void main() async {
  await WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: FirebaseOptions(
          apiKey: "AIzaSyCUwkb08uLtLROE33_rTe3ALElHEQxm2mw",
          appId: "1:84119325761:android:88ed23bee302f25fdc0ac0",
          messagingSenderId: "",
          projectId: "lunaloom-865e1"));
  User? user = FirebaseAuth.instance.currentUser;
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: user == null ? Fire_Splash():Fire_Home(),
  ));
}

class Fire_Splash extends StatefulWidget {
  const Fire_Splash({super.key});

  @override
  State<Fire_Splash> createState() => _Fire_SplashState();
}

class _Fire_SplashState extends State<Fire_Splash> {
  @override
  void initState() {
    Timer(Duration(seconds: 5), () {
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => Fire_Login()));
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/gif/dont-touch-me.gif'))),
        ),
      ),
    );
  }
}
