import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:herewegoagain/firebasedatabas/phone_password_auth/home.dart';
import 'package:herewegoagain/firebasedatabas/phone_password_auth/phnauth_ex.dart';


class Verify_otp extends StatelessWidget {
  final otpcontroller = TextEditingController();
  String verificationID = '';

  Verify_otp({super.key, required this.verificationID});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('verify otp'),
        backgroundColor: Colors.red,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: otpcontroller,
              decoration: InputDecoration(
                hintText: 'enter otp',
                border: OutlineInputBorder(),
              ),
            ),
            MaterialButton(
              onPressed: () async {
                try {
                  PhoneAuthCredential credential = PhoneAuthProvider.credential(
                      verificationId: verificationID,
                      smsCode: otpcontroller.text.toString());
                  FirebaseAuth.instance
                      .signInWithCredential(credential)
                      .then((value) {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) =>  Home_page()));
                  });
                } catch (ex) {
                  log(ex.toString());
                }
              },
              child: Text('verify'),
            ),
          ],
        ),
      ),
    );
  }
}