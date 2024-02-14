import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:herewegoagain/localstorage/hive_using_adapter/views/register.dart';
import 'package:hive_flutter/adapters.dart';

void main()async{
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  await Hive.openBox('userdata');
  runApp(GetMaterialApp(
    debugShowCheckedModeBanner: false,
    home: Hive_Login(),));
}

class Hive_Login extends StatefulWidget {
  const Hive_Login({super.key});

  @override
  State<Hive_Login> createState() => _Hive_LoginState();
}

class _Hive_LoginState extends State<Hive_Login> {

  final username_controller = TextEditingController();
  final email_controller = TextEditingController();
  final password_controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Login',
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 20),
            ),
            SizedBox(height: 20,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: TextField(
                controller: username_controller,
                decoration: InputDecoration(
                  hintText: "Username",
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    borderSide: BorderSide(
                        color: Colors.grey.shade300, width: 3),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    borderSide: BorderSide(
                        color: Colors.grey.shade300, width: 3),
                  ),
                  contentPadding: EdgeInsets.symmetric(
                      vertical: 15, horizontal: 30),
                  isDense: true,
                ),
              ),
            ),
            SizedBox(height: 10,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: TextField(
                controller: email_controller,
                decoration: InputDecoration(
                  hintText: "Email",
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    borderSide: BorderSide(
                        color: Colors.grey.shade300, width: 3),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    borderSide: BorderSide(
                        color: Colors.grey.shade300, width: 3),
                  ),
                  contentPadding: EdgeInsets.symmetric(
                      vertical: 15, horizontal: 30),
                  isDense: true,
                ),
              ),
            ),
            SizedBox(height: 10,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: TextField(
                controller: password_controller,
                decoration: InputDecoration(
                  hintText: "Password",
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    borderSide: BorderSide(
                        color: Colors.grey.shade300, width: 3),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    borderSide: BorderSide(
                        color: Colors.grey.shade300, width: 3),
                  ),
                  contentPadding: EdgeInsets.symmetric(
                      vertical: 15, horizontal: 30),
                  isDense: true,
                ),
              ),
            ),
            SizedBox(height: 20,),
            ElevatedButton(onPressed: (){},
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    minimumSize: Size(300, 50)),
                child: Text(
                  'LOGIN',
                  style: TextStyle(color: Colors.white),
                )),
            SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("user doesn't exist!"),
                SizedBox(width: 5,),
                TextButton(onPressed: (){
                  Get.to(Hive_Register());
                }, child: Text('Register'))
              ],
            )
          ],
        ),
      ),
    );
  }
}
