import 'package:flutter/material.dart';
import 'package:herewegoagain/firebasedatabas/email_password_auth/firebase_functions.dart';
import 'package:herewegoagain/firebasedatabas/email_password_auth/login.dart';

class Fire_Register extends StatelessWidget {
  final email = TextEditingController();
  final pass = TextEditingController();

  Fire_Register({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: const Text('Registration Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(10),
              child: TextField(
                controller: email,
                decoration: const InputDecoration(
                    hintText: "Enter Your Email", border: OutlineInputBorder()),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: TextField(
                controller: pass,
                decoration: const InputDecoration(
                    hintText: "Enter Your Password",
                    border: OutlineInputBorder()),
              ),
            ),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.grey.shade100,
                    shape: const StadiumBorder()),
                onPressed: () {
                  String emaill = email.text.trim();
                  String password = pass.text.trim();
                  FireBaseFunctions()
                      .registerUser(email: emaill, pwd: password)
                      .then((response) {
                    if (response == null) {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => Fire_Login()));
                    } else {
                      ScaffoldMessenger.of(context)
                          .showSnackBar(SnackBar(content: Text(response)));
                    }
                  });
                },
                child: const Text('Register Here')),
            SizedBox(
              height: 15,
            ),
            TextButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Fire_Login()));
                },
                child: RichText(
                  text: TextSpan(
                      text: "Already a User??",
                      style: TextStyle(color: Colors.purple),
                      children: [
                        TextSpan(
                            text: " Login Here!!",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                                color: Colors.red))
                      ]),
                ))
          ],
        ),
      ),
    );
  }
}
