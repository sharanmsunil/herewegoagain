import 'package:flutter/material.dart';
import 'package:herewegoagain/localstorage/sqflit_ex/punch/punchdbfunction.dart';
import 'package:herewegoagain/localstorage/sqflit_ex/punch/punchlogin.dart';
import 'package:herewegoagain/localstorage/sqflit_ex/punch/punchloginorsignup.dart';

class SignUpPunch extends StatefulWidget {
  @override
  State<SignUpPunch> createState() => _SignUpPunchState();
}

class _SignUpPunchState extends State<SignUpPunch> {

  var formkey = GlobalKey<FormState>();
  var cfullname = TextEditingController();
  var cphnum = TextEditingController();
  var cemailid = TextEditingController();
  var cpass = TextEditingController();

  @override
  Widget build(BuildContext context) {
    void registerUser(String name, String email,String phnnum, String password) async{
      var id = await SQL_Functions.addUser(name, email, phnnum, password); // id that return when we add new users
      print(id);
      if(id!= null){
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>LoginPunch()));
      } else{
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Registration Failed")));
      }
    }
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery
              .of(context)
              .size
              .height,
          width: MediaQuery
              .of(context)
              .size
              .width,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(
                      'assets/images/gradient-black-background-with-wavy-lines_23-2149150614.jpg'),
                  fit: BoxFit.cover)),
          child: Form(
            key: formkey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                    height: MediaQuery
                        .of(context)
                        .size
                        .height / 3,
                    width: MediaQuery
                        .of(context)
                        .size
                        .width,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'PUNCH',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 50,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          'Punch • Earn • Repeat',
                          style: TextStyle(color: Colors.white),
                        )
                      ],
                    )),
                Expanded(
                  child: Container(
                    height: MediaQuery
                        .of(context)
                        .viewInsets
                        .bottom,
                    width: MediaQuery
                        .of(context)
                        .size
                        .width,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(50),
                            topRight: Radius.circular(50))),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 10),
                              child: IconButton(
                                  onPressed: () {
                                    Navigator.of(context).push(MaterialPageRoute(
                                        builder: (context) => LoginOrSignUp()));
                                  },
                                  icon: Icon(Icons.arrow_back)),
                            ),
                            Expanded(
                                child: Center(
                                  child: Text(
                                    'Sign up',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20),
                                  ),
                                )),
                            SizedBox(
                              width: 70,
                            )
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 40,
                                vertical: 10,
                              ),
                              child: TextFormField(
                                validator: (fname){
                                  if(fname!.isEmpty){
                                    return "Fill the name field" ;
                                  }
                                },
                                controller: cfullname,
                                decoration: InputDecoration(
                                  hintText: 'Full Name',
                                  hintStyle:
                                  TextStyle(color: Colors.grey.shade300),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(50),
                                    borderSide: BorderSide(
                                        color: Colors.grey.shade300, width: 3),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius:
                                    BorderRadius.all(Radius.circular(50)),
                                    borderSide: BorderSide(
                                        color: Colors.grey.shade300, width: 3),
                                  ),
                                  contentPadding: EdgeInsets.symmetric(
                                      vertical: 15, horizontal: 30),
                                  isDense: true,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 40,
                                vertical: 10,
                              ),
                              child: TextFormField(
                                validator: (phnum){
                                  if(phnum!.isEmpty || phnum.length!=10){
                                    return "Invalid Phone Number";
                                  }
                                },
                                controller: cphnum,
                                decoration: InputDecoration(
                                  hintText: 'Phone Number',
                                  hintStyle:
                                  TextStyle(color: Colors.grey.shade300),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius:
                                    BorderRadius.all(Radius.circular(50)),
                                    borderSide: BorderSide(
                                        color: Colors.grey.shade300, width: 3),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius:
                                    BorderRadius.all(Radius.circular(50)),
                                    borderSide: BorderSide(
                                        color: Colors.grey.shade300, width: 3),
                                  ),
                                  contentPadding: EdgeInsets.symmetric(
                                      vertical: 15, horizontal: 30),
                                  isDense: true,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 40,
                                vertical: 10,
                              ),
                              child: TextFormField(
                                validator: (emailid){
                                  if(emailid!.isEmpty || !emailid.contains('@')){
                                    return "Invalid EmailId";
                                  }
                                },
                                controller: cemailid,
                                decoration: InputDecoration(
                                  hintText: 'Email Id',
                                  hintStyle:
                                  TextStyle(color: Colors.grey.shade300),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius:
                                    BorderRadius.all(Radius.circular(50)),
                                    borderSide: BorderSide(
                                        color: Colors.grey.shade300, width: 3),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius:
                                    BorderRadius.all(Radius.circular(50)),
                                    borderSide: BorderSide(
                                        color: Colors.grey.shade300, width: 3),
                                  ),
                                  contentPadding: EdgeInsets.symmetric(
                                      vertical: 15, horizontal: 30),
                                  isDense: true,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 40,
                                vertical: 10,
                              ),
                              child: TextFormField(
                                validator: (passs){
                                  if(passs!.isEmpty || passs.length<8){
                                    return "Password is empty / < 8";
                                  }
                                },
                                controller: cpass,
                                decoration: InputDecoration(
                                  hintText: 'Password',
                                  hintStyle:
                                  TextStyle(color: Colors.grey.shade300),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius:
                                    BorderRadius.all(Radius.circular(50)),
                                    borderSide: BorderSide(
                                        color: Colors.grey.shade300, width: 3),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius:
                                    BorderRadius.all(Radius.circular(50)),
                                    borderSide: BorderSide(
                                        color: Colors.grey.shade300, width: 3),
                                  ),
                                  contentPadding: EdgeInsets.symmetric(
                                      vertical: 15, horizontal: 30),
                                  isDense: true,
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.black,
                                minimumSize: Size(300, 50)),
                            onPressed: ()async{
                              var valid = formkey.currentState!.validate();
                              if(valid ==  true){
                                var users = await SQL_Functions.checkUser_already_registered(cemailid.text);
                                if(users.isNotEmpty){
                                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("User Already Registered!!")));
                                }else{
                                  registerUser(cfullname.text, cemailid.text, cphnum.text, cpass.text);
                                }
                              }else{
                                ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Please Fill All The Fields")));
                              }
                            },
                            child: Text(
                              'CREATE ACCOUNT',
                              style: TextStyle(color: Colors.white),
                            )),
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