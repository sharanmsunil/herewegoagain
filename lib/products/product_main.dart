import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:herewegoagain/products/productlistscreen.dart';

void main(){
  runApp(MyApp3());
}

class MyApp3 extends StatelessWidget {
  const MyApp3({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: ProductListScreen(),
    );
  }
}
