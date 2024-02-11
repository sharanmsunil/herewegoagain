import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:herewegoagain/firebasedatabas/phone_password_auth/home.dart';

class FB_OtpScreen extends StatefulWidget {
  final String verificationID;
  const FB_OtpScreen({super.key, required this.verificationID});

  @override
  State<FB_OtpScreen> createState() => _FB_OtpScreenState();
}

class _FB_OtpScreenState extends State<FB_OtpScreen> {
  @override
  Widget build(BuildContext context) {
    var otpctrl = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('OTP')),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextField(
            controller: otpctrl,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                hintText: 'OTP',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10)
                )
              ),
          ),
          SizedBox(
            height: 20,
          ),
          ElevatedButton(onPressed: ()async{
            try{
              PhoneAuthCredential credential =
                  PhoneAuthProvider.credential(
                      verificationId: widget.verificationID,
                      smsCode: otpctrl.text.toString());
              FirebaseAuth.instance
              .signInWithCredential(credential)
              .then((value) {
                Navigator.of(context).push(MaterialPageRoute(builder: (context)
                => Phn_Home()));
              });
            }catch (ex){
              log(ex.toString());
            }
          },
              child: Text('OTP Verify'))
        ],
      ),
    );
  }
}
