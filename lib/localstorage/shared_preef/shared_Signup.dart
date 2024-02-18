import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:herewegoagain/localstorage/shared_preef/shared_pref_ex.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Shared_Signup extends StatefulWidget {
  const Shared_Signup({super.key});

  @override
  State<Shared_Signup> createState() => _Shared_SignupState();
}

class _Shared_SignupState extends State<Shared_Signup> {
  var formkey = GlobalKey<FormState>();
  final emailctrl = TextEditingController();
  final phnumctrl = TextEditingController();
  final passctrl = TextEditingController();
  late SharedPreferences preferences;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff171a4d),
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Form(
            key: formkey,
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
                  'WELCOME BUDDY',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30,color: Colors.white),
                ),
                Text(
                  'Please Fill Your Details',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 10,color: Colors.grey),
                ),
                SizedBox(
                  height: 30,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: TextFormField(
                    style: TextStyle(color: Colors.white),
                    validator: (emailid){
                      if(emailid!.isEmpty || !emailid.contains('@')){
                        return "Invalid EmailId";
                      }
                    },
                    controller: emailctrl,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.person,color: Colors.white,),
                        hintText: 'Your Email ID', hintStyle: TextStyle(color: Colors.grey.shade400)),
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
                          child: TextFormField(
                              style: TextStyle(color: Colors.white),
                            validator: (phnum){
                              if(phnum!.isEmpty || phnum.length!=10){
                                return "Invalid Phone Number";
                              }
                            },
                            controller: phnumctrl,
                            decoration: InputDecoration(
                                prefixIcon: Icon(Icons.call,color: Colors.white,),
                                hintText: 'Your Mobile Number',hintStyle: TextStyle(color: Colors.grey.shade400)),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 30),
                          child: TextFormField(
                            style: TextStyle(color: Colors.white),
                            validator: (passs){
                              if(passs!.isEmpty || passs.length<8){
                                return "Password is empty / < 8";
                              }
                            },
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
                          child: ElevatedButton(onPressed: () async {
                            var valid = formkey.currentState!.validate();
                            if(valid == true){
                            preferences = await SharedPreferences.getInstance();
                            String email = emailctrl.text;
                            String phnnum = phnumctrl.text;
                            String pass = passctrl.text;
                              preferences.setString('Email', email);
                              preferences.setString('Phnnum', phnnum);
                              preferences.setString('Pass',pass);
                              Navigator.of(context).pushReplacement(
                                  MaterialPageRoute(builder: (context) => Shared_Login()));
                            emailctrl.clear();
                            phnumctrl.clear();
                            passctrl.clear();
                            }else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(content: Text('Must not be Empty/Password should be same')));
                            }
                          }, child: Text("Sign Up",style: TextStyle(color: Colors.white),),
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
                              text: 'Already have an acccount?',
                              style: TextStyle(color: Colors.white),
                              children:  <TextSpan>[
                                TextSpan(text: ' Sign in', style: TextStyle(color: Color(0xff019dfe)),
                                recognizer: TapGestureRecognizer()..onTap = (){
                                  Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Shared_Login()));
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

              ],
            ),
          ),
        ),
      ),
    );
  }
}
