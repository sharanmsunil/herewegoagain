import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:herewegoagain/firebasedatabas/phone_password_auth/login_phn.dart';

class Phn_Home extends StatelessWidget {
   Phn_Home({super.key});
  final ButtonStyle style = ElevatedButton.styleFrom(
      minimumSize: Size(188, 48),
      backgroundColor: Color(0xFF051B8B),
      elevation: 6,
      textStyle: const TextStyle(fontSize: 16),
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(50),
          )));

  // void _userHome() async {
  //   Get.to(Phn_Login());
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff0F2B2F),
      body: Center(
        child: Column(
          children: [
            Text(
              'Welcome',
              style: TextStyle(
                  color: Colors.white, fontSize: 30, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            ElevatedButton(
                style: style,
                onPressed: (){},
                //_userHome,
                child: const Text(
                  'TEST AGAIN',
                  style: TextStyle(fontSize: 14, color: Colors.white),
                )),
          ],
        ),
      ),
    );
  }
}
