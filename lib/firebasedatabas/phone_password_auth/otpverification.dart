import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class FirebaseAuthentication {
  String phoneNumber = "";

  sendOTP(String phoneNumber) async {
    this.phoneNumber = phoneNumber;
    FirebaseAuth auth = FirebaseAuth.instance;
    ConfirmationResult result = await auth.signInWithPhoneNumber(
      '+91$phoneNumber',
    );
    printMessage("OTP Sent to +91 $phoneNumber");
    return result;
  }

  authenticate(ConfirmationResult confirmationResult, String otp) async {
    UserCredential userCredential = await confirmationResult.confirm(otp);
    userCredential.additionalUserInfo!.isNewUser
        ? printMessage("Authentication Successful")
        : printMessage("User already exists");
  }

  printMessage(String msg) {
    debugPrint(msg);
  }
}