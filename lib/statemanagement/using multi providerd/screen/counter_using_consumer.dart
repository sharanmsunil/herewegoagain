import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../controller/counter_provider.dart';
import '../controller/theme_provider.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (context)=> ThemeProvider()),
    ChangeNotifierProvider(create: (context) => CounterProvider1())
  ],
    child: MyApp1(),),);
}
class MyApp1 extends StatelessWidget {
  const MyApp1({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "Provider",
        theme: Provider.of<ThemeProvider>(context).darkTheme
            ? ThemeData.dark()
            : ThemeData.light(),
        darkTheme: ThemeData.dark(),
        debugShowCheckedModeBanner: false,
        home: IncreCount1()
    );
  }
}


class IncreCount1 extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Consumer(builder: (context,ThemeProvider provider,child){
          return IconButton(onPressed: (){
            provider.switchTheme();
          }, icon: Icon(provider.darkTheme? Icons.dark_mode:Icons.light_mode));
        }),
        backgroundColor: Colors.purple,
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
            Consumer<CounterProvider1>(
              builder: (BuildContext context, CounterProvider1 counterprovider, Widget? child) {
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
                        backgroundColor: Colors.green,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)
                        )
                    ),
                    onPressed: () {
                      Provider.of<CounterProvider1>(context,listen: false).increment();
                    },
                    child: Text("+",style: TextStyle(fontSize: 30,color: Colors.black,fontWeight: FontWeight.bold))),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)
                        )
                    ),
                    onPressed: () {
                      Provider.of<CounterProvider1>(context,listen: false).decrement();
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