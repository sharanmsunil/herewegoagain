import 'package:flutter/material.dart';
import 'package:herewegoagain/statemanagement/using%20single%20provider/provider/counter_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: ChangeNotifierProvider(
      create: (context) => CounterProvider(),
      child: IncreCountP(),
    ),
  ));
}

class IncreCountP extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          "Counter",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Press Button to Increment value",
              style: TextStyle(fontSize: 15),
            ),
            Consumer<CounterProvider>(
              builder: (BuildContext context, CounterProvider counterprovider, Widget? child) {
                return Text(
                  "Count : ${counterprovider.counter.count}",
                  style: TextStyle(fontSize: 25),
                );
              },
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.grey.shade300,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)
                        )
                    ),
                    onPressed: () {
                      Provider.of<CounterProvider>(context,listen: false).increment();
                    },
                    child: Text("+",style: TextStyle(fontSize: 30,color: Colors.black,fontWeight: FontWeight.bold))),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.grey.shade300,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)
                        )
                    ),
                    onPressed: () {
                      Provider.of<CounterProvider>(context,listen: false).decrement();
                    },
                    child: Text("-",style: TextStyle(fontSize: 30,color: Colors.black,fontWeight: FontWeight.bold),)),
                // InkWell(
                //   onTap:
                //   (){
                //     counterProvider.decrement();
                //   },
                //     child: Text('-'))
              ],
            ),

          ],
        ),
      ),
    );
  }
}
