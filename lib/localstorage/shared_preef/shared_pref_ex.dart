import 'package:flutter/material.dart';
import 'package:herewegoagain/localstorage/shared_preef/shared_Signup.dart';
import 'package:herewegoagain/localstorage/shared_preef/shared_home_ex.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Shared_Login(),
  ));
}

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
    checkTheUserIsAlreadyLoggedIn();
    storedata();
    super.initState();
  }

  void checkTheUserIsAlreadyLoggedIn() async {
    preferences = await SharedPreferences.getInstance();
    isANewUser = preferences.getBool('newUser') ?? true;
    if(isANewUser == false){
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => Shared_Home()));
    }
  }
  void storedata()async{
    preferences = await SharedPreferences.getInstance();
    username = preferences.getString('Email')!;
    password = preferences.getString('Pass')!;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Login',
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
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: TextField(
                controller: passctrl,
                decoration: InputDecoration(
                    hintText: 'Password', border: OutlineInputBorder()),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
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
                child: Text('Login')),
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
            SizedBox(
              height: 20,
            ),
            ElevatedButton(onPressed: (){
              Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Shared_Signup()));
            }, child: Text("Sign Up"))
          ],
        ),
      ),
    );
  }
}
