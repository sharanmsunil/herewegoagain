import 'dart:async';

import 'package:flutter/material.dart';
import 'package:herewegoagain/localstorage/sqflit_ex/punch/punchloginorsignup.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Punch_Splash(),
  ));
}

class Punch_Splash extends StatefulWidget {
  const Punch_Splash({super.key});

  @override
  State<Punch_Splash> createState() => _Punch_SplashState();
}

class _Punch_SplashState extends State<Punch_Splash> {
  void initState() {
    super.initState();
    Timer(
        Duration(seconds: 3),
        () => Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => LoginOrSignUp())));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(
                    'assets/images/pngtree-simple-color-graffiti-line-background-picture-image_1286552.jpg'),
                fit: BoxFit.cover)),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GradientText(
                'PUNCH',
                style: TextStyle(fontSize: 40.0, fontWeight: FontWeight.bold),
                //gradientType: GradientType.radial,
                colors: [
                  Colors.pink,
                  Colors.black,
                  Colors.purple,
                  Colors.black,
                  Colors.blueAccent,
                  Colors.black,
                  Colors.lightBlue,
                ],
              ),
              SizedBox(
                height: 10,
              ),
              RichText(
                text: TextSpan(
                  text: 'Punch',
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.pink,
                      fontWeight: FontWeight.bold),
                  children: const <TextSpan>[
                    TextSpan(
                        text: ' • ',
                        style: TextStyle(fontSize: 20, color: Colors.black)),
                    TextSpan(
                        text: 'Earn',
                        style:
                            TextStyle(fontSize: 20, color: Colors.blueAccent)),
                    TextSpan(
                        text: ' • ',
                        style: TextStyle(fontSize: 20, color: Colors.black)),
                    TextSpan(
                        text: 'Repeat',
                        style:
                            TextStyle(fontSize: 20, color: Colors.lightBlue)),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
