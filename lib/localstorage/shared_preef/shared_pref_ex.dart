import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:herewegoagain/localstorage/shared_preef/shared_Signup.dart';
import 'package:herewegoagain/localstorage/shared_preef/shared_home_ex.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Shared_Login extends StatefulWidget {
  const Shared_Login({super.key});

  @override
  State<Shared_Login> createState() => _Shared_LoginState();
}

class _Shared_LoginState extends State<Shared_Login> {
  final textctrl = TextEditingController();
  final passctrl = TextEditingController();
  late String username;
  late String password;
  late SharedPreferences preferences;
  late bool isANewUser;

  @override
  void initState() {
    // checkTheUserIsAlreadyLoggedIn();
    storedata();
    super.initState();
  }

  // void checkTheUserIsAlreadyLoggedIn() async {
  //   preferences = await SharedPreferences.getInstance();
  //   isANewUser = preferences.getBool('newUser') ?? true;
  //   if(isANewUser == false){
  //     Navigator.of(context).pushReplacement(
  //         MaterialPageRoute(builder: (context) => Shared_Home()));
  //   }
  // }
  void storedata()async{
    preferences = await SharedPreferences.getInstance();
    username = preferences.getString('Email')!;
    password = preferences.getString('Pass')!;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff171a4d),
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
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
                            color: Color(0xff3d49c0),
                            borderRadius: BorderRadius.only(bottomLeft: Radius.circular(200),bottomRight: Radius.circular(200))
                        ),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                          image: DecorationImage(image:
                          AssetImage("assets/images/women-homeo-cure-clinic-1024x1024.png"))
                      ),
                    )
                  ],
                ),
              ),
              Text(
                'WELCOME BACK !!',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30,color: Colors.white),
              ),
              Text(
                'Please Enter Your Email and Password',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 10,color: Colors.grey),
              ),
              SizedBox(
                height: 30,
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
                          style: TextStyle(color: Colors.white),
                          controller: textctrl,
                          decoration: InputDecoration(
                              prefixIcon: Icon(Icons.person,color: Colors.white,),
                              hintText: 'Your Username',hintStyle: TextStyle(color: Colors.grey.shade400)),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 30),
                        child: TextField(
                          style: TextStyle(color: Colors.white),
                          controller: passctrl,
                          decoration: InputDecoration(
                              prefixIcon: Icon(Icons.lock,color: Colors.white,),
                              hintText: 'Enter Your Password',hintStyle: TextStyle(color: Colors.grey.shade400)),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: ElevatedButton(
                            onPressed: () async {
                              preferences = await SharedPreferences.getInstance();
                              String email = textctrl.text;
                              String pwd = passctrl.text;
                              if (email == username && pwd == password) {
                                preferences.setBool('newUser', false);
                                Navigator.of(context).pushReplacement(
                                    MaterialPageRoute(builder: (context) => Shared_Home()));
                                textctrl.clear();
                                passctrl.clear();
                              } else {
                                ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(content: Text('Must not be Empty/Account not found')));
                              }
                            },
                            child: Text('Login',style: TextStyle(color: Colors.white),),
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Color(0xff019dfe),
                              minimumSize: Size(150, 50),
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10)))
                          ),),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: Text.rich(
                          TextSpan(
                            text: "Doesn't have an acccount?",
                            style: TextStyle(color: Colors.white),
                            children:  <TextSpan>[
                              TextSpan(text: ' Sign up', style: TextStyle(color: Color(0xff019dfe)),
                                  recognizer: TapGestureRecognizer()..onTap = (){
                                    Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Shared_Signup()));
                                  }),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            FaIcon(FontAwesomeIcons.facebook,color: Colors.white,),
                            SizedBox(width: 5,),
                            FaIcon(FontAwesomeIcons.instagram,color: Colors.white,),
                            SizedBox(width: 5,),
                            FaIcon(FontAwesomeIcons.youtube,color: Colors.white,),
                            SizedBox(width: 5,),
                            FaIcon(FontAwesomeIcons.twitter,color: Colors.white,),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),

              // ElevatedButton(
              //     onPressed: () async {
              //       preferences = await SharedPreferences.getInstance();
              //       String email = textctrl.text;
              //       String pwd = passctrl.text;
              //       if (email != "" && pwd != "") {
              //         preferences.setString('Email', email);
              //         preferences.setString('Pass', passctrl.text);
              //         preferences.setBool('newUser', false);
              //         Navigator.of(context).pushReplacement(
              //             MaterialPageRoute(builder: (context) => Shared_Home()));
              //         textctrl.clear();
              //         passctrl.clear();
              //       } else {
              //         ScaffoldMessenger.of(context).showSnackBar(
              //             SnackBar(content: Text('Must not be Empty')));
              //       }
              //     },
              //     child: Text('Login')),
              // SizedBox(
              //   height: 20,
              // ),
              // ElevatedButton(onPressed: (){
              //   Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Shared_Signup()));
              // }, child: Text("Sign Up"))
            ],
          ),
        ),
      ),
    );
  }
}
