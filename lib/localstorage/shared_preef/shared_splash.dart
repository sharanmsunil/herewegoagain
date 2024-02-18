import 'dart:async';

import 'package:flutter/material.dart';
import 'package:herewegoagain/localstorage/shared_preef/shared_loginorsignup.dart';


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
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3),
            ()=>Navigator.pushReplacement(context,
            MaterialPageRoute(builder:
                (context) =>
                Shared_lo_Si()
            )
        )
    );
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
