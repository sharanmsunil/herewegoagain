import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:herewegoagain/statemanagement/using%20getx/controller/countCntrl.dart';

void main(){
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: GetCountMain(),
  ));
}

class GetCountMain extends StatelessWidget {
  const GetCountMain({super.key});

  @override
  Widget build(BuildContext context) {
    //Creating an instance of controller (or register the controller inside this widget tree)
    final CountCntrl countcontroller = Get.put(CountCntrl());
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text("Getx Count",style: TextStyle(color: Colors.white),),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("counter using Getx",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 20),),
            Obx(() => Text("Count = ${countcontroller.count}",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 20),)),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                InkWell(
                  onTap: (){
                    countcontroller.increment();
                  },
                  child: CircleAvatar(
                    backgroundColor: Colors.green,
                    child: Icon(Icons.add),
                  ),
                ),
                InkWell(
                  onTap: (){
                    countcontroller.decrement();
                  },
                  child: CircleAvatar(
                    backgroundColor: Colors.red,
                    child: Icon(Icons.minimize_rounded),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
