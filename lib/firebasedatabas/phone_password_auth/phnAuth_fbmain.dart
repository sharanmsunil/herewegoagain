import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:herewegoagain/firebasedatabas/phone_password_auth/phnAuth_otpscreen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: FirebaseOptions(apiKey: "AIzaSyCUwkb08uLtLROE33_rTe3ALElHEQxm2mw",
          appId: "1:84119325761:android:88ed23bee302f25fdc0ac0",
          messagingSenderId: "",
          projectId: "lunaloom-865e1")
  );
  runApp(MaterialApp(debugShowCheckedModeBanner: false,
  home: FB_PhnAuth(),));
}

class FB_PhnAuth extends StatefulWidget {
  const FB_PhnAuth({super.key});

  @override
  State<FB_PhnAuth> createState() => _FB_PhnAuthState();
}

class _FB_PhnAuthState extends State<FB_PhnAuth> {
  @override
  Widget build(BuildContext context) {
    var phnctrl = TextEditingController();
    return Scaffold(
      appBar: AppBar(title: Center(child: Text("Phone Authentication")),),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(padding: EdgeInsets.all(12),
          child: TextField(
            controller: phnctrl,
            keyboardType: TextInputType.phone,
              decoration: InputDecoration(
                hintText: 'Phone Number',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10)
                )
              ),
          ),),
          SizedBox(height: 20,),
          ElevatedButton(onPressed: ()async{
            await FirebaseAuth.instance.verifyPhoneNumber(
            phoneNumber: phnctrl.text.toString(),
            verificationCompleted: (PhoneAuthCredential credential){},
                verificationFailed: (FirebaseAuthException e){},
                codeSent: (String verificationId, int? resentToken){
              Navigator.of(context).push(MaterialPageRoute(builder: (context)=> FB_OtpScreen(
                verificationID: verificationId,
              )));
            },
                codeAutoRetrievalTimeout: (String verificationId){});
          }, child: Text('Verify Phone Number'))
        ],
      ),
    );
  }
}
