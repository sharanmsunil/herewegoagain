import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:herewegoagain/firebasedatabas/phone_password_auth/home.dart';
import 'package:herewegoagain/firebasedatabas/phone_password_auth/phnauth_otpex.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: FirebaseOptions(apiKey: "AIzaSyCUwkb08uLtLROE33_rTe3ALElHEQxm2mw",
          appId: "1:84119325761:android:88ed23bee302f25fdc0ac0",
          messagingSenderId: "",
          projectId: "lunaloom-865e1"));

  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Home_page(),
  ));
}

class Home_page extends StatelessWidget {
  final phonecontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('phone auth'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                keyboardType: TextInputType.number,
                controller: phonecontroller,
                decoration: InputDecoration(
                  hintText: 'enter phone number',
                  border: OutlineInputBorder(),
                ),
              )),
          ElevatedButton(
               onPressed: ()
            async {
                final FirebaseAuth auth = FirebaseAuth.instance;
                await auth.verifyPhoneNumber(
                    phoneNumber: phonecontroller.text.toString(),
                    timeout: Duration(seconds: 120),
                    verificationCompleted: (PhoneAuthCredential credential) {},
                    verificationFailed: (FirebaseAuthException e) {},
                    codeSent: (String validationid, int? resendtoken) {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) =>
                              Verify_otp(verificationID: validationid)));
                    },
                    codeAutoRetrievalTimeout: (String verificationId) {});
              },
              child: Text('get otp')),
        ],
      ),
    );
  }
}