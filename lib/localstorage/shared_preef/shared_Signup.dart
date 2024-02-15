import 'package:flutter/material.dart';
import 'package:herewegoagain/localstorage/shared_preef/shared_pref_ex.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Shared_Signup extends StatefulWidget {
  const Shared_Signup({super.key});

  @override
  State<Shared_Signup> createState() => _Shared_SignupState();
}

class _Shared_SignupState extends State<Shared_Signup> {
  final textctrl = TextEditingController();
  final confirmpassctrl = TextEditingController();
  final passctrl = TextEditingController();
  late SharedPreferences preferences;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.height,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: MediaQuery.of(context).size.height/2.5,
                width: MediaQuery.of(context).size.width,
                child: Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 50),
                      child: Container(
                        height: double.infinity,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            color: Colors.grey,
                          borderRadius: BorderRadius.only(bottomLeft: Radius.circular(200),bottomRight: Radius.circular(200))
                        ),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                          image: DecorationImage(image:
                          AssetImage("assets/images/yoga.jpg"))
                      ),
                    )
                  ],
                ),
              ),
              Text(
                'Signup',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
              ),
              SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: TextField(
                  controller: textctrl,
                  decoration: InputDecoration(
                      hintText: 'Username', border: OutlineInputBorder()),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Expanded(
                child: Container(
                  height: MediaQuery.of(context).viewInsets.bottom,
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 30),
                        child: TextField(
                          controller: passctrl,
                          decoration: InputDecoration(
                              hintText: 'pasword', border: OutlineInputBorder()),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 30),
                        child: TextField(
                          controller: confirmpassctrl,
                          decoration: InputDecoration(
                              hintText: 'Confirm Password', border: OutlineInputBorder()),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      ElevatedButton(onPressed: () async {
                        preferences = await SharedPreferences.getInstance();
                        String email = textctrl.text;
                        String pwd = passctrl.text;
                        String cpwd = confirmpassctrl.text;
                        if (email != "" && pwd != "" && pwd == cpwd) {
                          preferences.setString('Email', email);
                          preferences.setString('Pass', pwd);
                          preferences.setString('CPass',cpwd);
                          Navigator.of(context).pushReplacement(
                              MaterialPageRoute(builder: (context) => Shared_Login()));
                          textctrl.clear();
                          passctrl.clear();
                          confirmpassctrl.clear();
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text('Must not be Empty/Password should be same')));
                        }
                      }, child: Text("Sign Up"))
                    ],
                  ),
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
