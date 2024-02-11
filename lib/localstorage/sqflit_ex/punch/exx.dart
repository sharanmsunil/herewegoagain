import 'package:flutter/material.dart';
import 'package:herewegoagain/localstorage/sqflit_ex/punch/punchdbfunction.dart';


class Login_Punch extends StatelessWidget {
  var formkey = GlobalKey<FormState>();
  var cemailid = TextEditingController();
  var cpass = TextEditingController();

  @override
  Widget build(BuildContext context) {
    void loginUser(String email, String pwd) async{
      //admin login
      if(email == 'admin@gmail'  && pwd == 'admin123'){
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Home_Punch());
      }else{
        var data = await SQL_Functions.CheckUserExist(email, pwd);
        if(data.isNotEmpty){
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>User_Home()));
        }else{
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("User not found")));
        }
      }
    }
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(
                      'assets/images/punch.png'),
                  fit: BoxFit.cover)),
          child: Form(
            key: formkey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                    height: MediaQuery.of(context).size.height / 2.2,
                    width: MediaQuery.of(context).size.width,
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
                    height: MediaQuery.of(context).viewInsets.bottom,
                    width: MediaQuery.of(context).size.width,
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
                                        builder: (context) => Login_Sign2()));
                                  },
                                  icon: Icon(Icons.arrow_back)),
                            ),
                            Expanded(
                                child: Center(
                                  child: Text(
                                    'Login',
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
                            onPressed: () {
                              var valid = formkey.currentState!.validate();
                              if(valid == true){
                                loginUser(cemailid.text, cpass.text);
                              }else{
                                ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Please Fill All The Fields')));
                              }
                            },
                            child: Text(
                              'LOGIN',
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
