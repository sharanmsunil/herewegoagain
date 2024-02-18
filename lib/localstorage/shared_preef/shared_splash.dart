import 'dart:async';

import 'package:flutter/material.dart';
import 'package:herewegoagain/localstorage/shared_preef/shared_home_ex.dart';
import 'package:herewegoagain/localstorage/shared_preef/shared_loginorsignup.dart';
import 'package:shared_preferences/shared_preferences.dart';


void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Shared_Splash(),
  ));
}


class Shared_Splash extends StatefulWidget {
  const Shared_Splash({super.key});

  @override
  State<Shared_Splash> createState() => _Shared_SplashState();
}

class _Shared_SplashState extends State<Shared_Splash> {
  late SharedPreferences preferences;
  late bool isANewUser;
  @override
  void initState() {
    checkTheUserIsAlreadyLoggedIn();
    super.initState();
  }
  void checkTheUserIsAlreadyLoggedIn() async {
    preferences = await SharedPreferences.getInstance();
    isANewUser = preferences.getBool('newUser') ?? true;
    if(isANewUser == false){
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => Shared_Home()));
    }else if(isANewUser == true){
      Timer(Duration(seconds: 3),
              ()=>Navigator.pushReplacement(context,
              MaterialPageRoute(builder:
                  (context) =>
                  Shared_lo_Si()
              )
          )
      );
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff171a4d),
      body: Center(
        child: Container(
              decoration: BoxDecoration(
                  image: DecorationImage(image:
                  AssetImage("assets/images/women-homeo-cure-clinic-1024x1024.png"))
              ),
            )

      ),
    );
  }
}
