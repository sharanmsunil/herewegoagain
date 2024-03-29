import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:herewegoagain/firebasedatabas/email_password_auth/firebase_functions.dart';
import 'package:herewegoagain/firebasedatabas/email_password_auth/login.dart';

class Fire_Home extends StatelessWidget {
  const Fire_Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            FireBaseFunctions().logoutUser().then((value) =>
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context)=>Fire_Login())));
          },
          child: Text("LogOut"),
        ),
      ),
    );
  }
}
