import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:herewegoagain/localstorage/hive_using_adapter/views/login.dart';

import '../model/users.dart';
import '../services/hiveDB.dart';

class Hive_Register extends StatefulWidget {
  const Hive_Register({super.key});

  @override
  State<Hive_Register> createState() => _Hive_RegisterState();
}

class _Hive_RegisterState extends State<Hive_Register> {
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
              'Register',
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 20),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: TextField(
                controller: username_controller,
                decoration: InputDecoration(
                  hintText: "Username",
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    borderSide:
                        BorderSide(color: Colors.grey.shade300, width: 3),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    borderSide:
                        BorderSide(color: Colors.grey.shade300, width: 3),
                  ),
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 15, horizontal: 30),
                  isDense: true,
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: TextField(
                controller: email_controller,
                decoration: InputDecoration(
                  hintText: "Email",
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    borderSide:
                        BorderSide(color: Colors.grey.shade300, width: 3),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    borderSide:
                        BorderSide(color: Colors.grey.shade300, width: 3),
                  ),
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 15, horizontal: 30),
                  isDense: true,
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: TextField(
                controller: password_controller,
                decoration: InputDecoration(
                  hintText: "Password",
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    borderSide:
                        BorderSide(color: Colors.grey.shade300, width: 3),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    borderSide:
                        BorderSide(color: Colors.grey.shade300, width: 3),
                  ),
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 15, horizontal: 30),
                  isDense: true,
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
                onPressed: () async {
                  //fetch all registered users from db
                  // final reg_users = await instance.HiveDB.getallusers();
                  final reg_users = await HiveDB.getallusers();
                  validateSignUp(context, reg_users);
                },
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black, minimumSize: Size(300, 50)),
                child: Text(
                  'REGISTER',
                  style: TextStyle(color: Colors.white),
                )),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('already registered??'),
                SizedBox(
                  width: 5,
                ),
                TextButton(
                    onPressed: () {
                      Get.to(Hive_Login());
                    },
                    child: Text('Login'))
              ],
            )
          ],
        ),
      ),
    );
  }

  void validateSignUp(BuildContext context, List<Users> users) async {
    final name = username_controller.text;
    final pwd = password_controller.text;
    final email = email_controller.text;
    bool userExist = false;
    final validateEmail =
        EmailValidator.validate(email); //result will be in bool
    if (email != "" && pwd != "" && name != "") {
      if (validateEmail == true) {
        await Future.forEach(users, (singleUser) {
          if (singleUser.email == email) {
            userExist = true;
          } else {
            userExist = false;
          }
        });
        if (userExist == true) {
          Get.snackbar("Failed", "User Already Exist !!",
              colorText: Colors.red, backgroundColor: Colors.red[100]);
        } else {
          if (pwd.length < 6) {
            Get.snackbar("Error", "Password must be atleast 6 character");
          } else {
            final user = Users(email: email, password: pwd, username: name);
            await HiveDB.addUser(user);
            Get.snackbar("Success", "User Registration Success",
                colorText: Colors.white, backgroundColor: Colors.green[800]);
            Get.to(Hive_Login());
          }
        }
      } else {
        Get.snackbar("Invalid Data", "Invalid Email Id",
            colorText: Colors.red, backgroundColor: Colors.red[100]);
      }
    } else {
      Get.snackbar("Empty Fields", "Fields MustNot be empty",
          colorText: Colors.red, backgroundColor: Colors.red[100]);
    }
  }
}
