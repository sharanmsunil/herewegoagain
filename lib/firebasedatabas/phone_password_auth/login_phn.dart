import 'package:flutter/material.dart';

import 'otpverification.dart';

class Phn_Login extends StatefulWidget {
  const Phn_Login({super.key});

  @override
  State<Phn_Login> createState() => _Phn_LoginState();
}

class _Phn_LoginState extends State<Phn_Login> {

  TextEditingController phoneNumber = TextEditingController();
  TextEditingController otp = TextEditingController();
  bool visible = false;
  var temp;

  @override
  void dispose() {
    phoneNumber.dispose();
    otp.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff0F2B2F),
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            inputTextField("Contact Number", phoneNumber, context),
            visible ? inputTextField("OTP", otp, context) : SizedBox(),
            !visible ? SendOTPButton("Send OTP") : SubmitOTPButton("Submit"),
          ],
        ),
      ),
    );
  }


Widget SendOTPButton(String text) => ElevatedButton(
  onPressed: () async {
    setState(() {visible = !visible;});
    temp = await FirebaseAuthentication().sendOTP(phoneNumber.text);
  },
  child: Text(text),
);

Widget SubmitOTPButton(String text) => ElevatedButton(
  onPressed: () =>FirebaseAuthentication().authenticate(temp, otp.text),
  child: Text(text),
);

Widget inputTextField(String labelText, TextEditingController textEditingController, BuildContext context) =>
    Padding(
      padding: EdgeInsets.all(10.00),
      child: SizedBox(
        width: MediaQuery.of(context).size.width / 1.5,
        child: TextFormField(
          obscureText: labelText == "OTP" ? true : false,
          controller: textEditingController,
          decoration: InputDecoration(
            hintText: labelText,
            hintStyle: TextStyle(color: Colors.blue),
            filled: true,
            fillColor: Colors.blue[100],
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.transparent),
              borderRadius: BorderRadius.circular(5.5),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.transparent),
              borderRadius: BorderRadius.circular(5.5),
            ),
          ),
        ),
      ),
    );
}
