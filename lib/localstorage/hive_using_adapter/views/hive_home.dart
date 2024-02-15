import 'package:flutter/material.dart';

class Hive_Home extends StatelessWidget {
   String? uname;
   Hive_Home({super.key,required this.uname});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("Welcome $uname"),
      ),
    );
  }
}
