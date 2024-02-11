import 'package:flutter/material.dart';
import 'package:herewegoagain/firebasedatabas/email_password_auth/firebase_functions.dart';
import 'package:herewegoagain/firebasedatabas/email_password_auth/register.dart';

import 'home.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Fire_Login(),
  ));
}

class Fire_Login extends StatelessWidget {
  final email = TextEditingController();
  final pass = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: const Text('Login Page'),
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
            MaterialButton(
              onPressed: () {
                FireBaseFunctions()
                    .loginUser(emaill: email.text.trim(), pwd: pass.text.trim())
                    .then((response) {
                  if (response == null) {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => Fire_Home()));
                  }
                });
              },
              shape: const StarBorder(),
              color: Colors.orange,
              child: const Text('Login'),
            ),
            SizedBox(
              height: 15,
            ),
            TextButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Fire_Register()));
                },
                child: RichText(
                  text: TextSpan(
                      text: "Not a User??",
                      style: TextStyle(color: Colors.purple),
                      children: [
                        TextSpan(
                            text: " Register Here!!",
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
