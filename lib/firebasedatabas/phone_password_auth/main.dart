import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:herewegoagain/firebasedatabas/phone_password_auth/login_phn.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: FirebaseOptions(
          apiKey: "AIzaSyCUwkb08uLtLROE33_rTe3ALElHEQxm2mw",
          appId: "1:84119325761:android:88ed23bee302f25fdc0ac0",
          messagingSenderId: "",
          projectId: "lunaloom-865e1")
  );


  runApp( MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Phn_Login(),
  ));
}

