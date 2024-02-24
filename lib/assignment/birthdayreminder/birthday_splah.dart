import 'package:flutter/material.dart';

void main(){
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Birthday_Spash(),
  ));
}
class Birthday_Spash extends StatefulWidget {
  const Birthday_Spash({super.key});

  @override
  State<Birthday_Spash> createState() => _Birthday_SpashState();
}

class _Birthday_SpashState extends State<Birthday_Spash> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height/2,
            width: MediaQuery.of(context).size.width,
            child: Stack(
              alignment: Alignment.center,
              children: [
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 100),
                    child: RichText(text: TextSpan(text: "Birth",style: TextStyle(color: Colors.blue,fontWeight: FontWeight.bold,fontSize: 40),children:const <TextSpan>[
                      TextSpan(text: "daily",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 40)),
                    ])),
                  ),
                ),
                Align(
                    alignment: Alignment.bottomCenter,
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 70),
                      child: Text("Never miss important events of",style: TextStyle(color: Colors.blue,fontSize: 10),),
                    )),
                Align(
                    alignment: Alignment.bottomCenter,
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 60),
                      child: Text("the people you care for!",style: TextStyle(color: Colors.blue,fontSize: 10),),
                    )),
                SizedBox(
                    width: 100,
                    height: 140,
                    child: Image.asset("assets/birthdayrem/7dfcaf6cf57d5e8b362b1b7ebf302482-removebg-preview.png")),
                Align(
                  alignment: Alignment.bottomRight,
                  widthFactor: 30,
                  child: CircleAvatar(
                    radius: 3,
                    backgroundColor: Colors.blueAccent,
                  ),
                ),
                Align(
                  alignment: Alignment.bottomRight,
                  widthFactor: 24,
                  heightFactor: 17,
                  child: CircleAvatar(
                    radius: 6,
                    backgroundColor: Colors.blueAccent,
                  ),
                ),
                Align(
                  alignment: Alignment.bottomRight,
                  widthFactor: 27,
                  heightFactor: 10,
                  child: CircleAvatar(
                    radius: 4,
                    backgroundColor: Colors.orange,
                  ),
                ),
                Align(
                  alignment: Alignment.topRight,
                  widthFactor: 18,
                  heightFactor: 8,
                  child: CircleAvatar(
                    radius: 6,
                    backgroundColor: Colors.pink,
                  ),
                ),
                Align(
                  alignment: Alignment.topRight,
                  widthFactor: 13,
                  heightFactor: 11,
                  child: CircleAvatar(
                    radius: 13,
                    backgroundColor: Colors.lightBlue,
                  ),
                ),
                Align(
                  alignment: Alignment.topRight,
                  widthFactor: 13,
                  heightFactor: 27,
                  child: CircleAvatar(
                    radius: 6,
                    backgroundColor: Colors.pink,
                  ),
                ),
                Align(
                  alignment: Alignment.topRight,
                  widthFactor: 7,
                  heightFactor: 23,
                  child: CircleAvatar(
                    radius: 4,
                    backgroundColor: Colors.orange,
                  ),
                ),
                Align(
                  alignment: Alignment.topLeft,
                  widthFactor: 7,
                  heightFactor: 23,
                  child: CircleAvatar(
                    radius: 6,
                    backgroundColor: Colors.blueAccent,
                  ),
                ),
                Align(
                  alignment: Alignment.topLeft,
                  widthFactor: 27,
                  heightFactor: 28,
                  child: CircleAvatar(
                    radius: 6,
                    backgroundColor: Colors.blueAccent,
                  ),
                ),
                Align(
                  alignment: Alignment.topLeft,
                  widthFactor: 12,
                  heightFactor: 10,
                  child: CircleAvatar(
                    radius: 12,
                    backgroundColor: Colors.orange,
                  ),
                ),
                Align(
                  alignment: Alignment.topLeft,
                  widthFactor: 35,
                  heightFactor: 8,
                  child: CircleAvatar(
                    radius: 5,
                    backgroundColor: Colors.pink,
                  ),
                ),
                Align(
                  alignment: Alignment.bottomLeft,
                  widthFactor: 74,
                  heightFactor: 10,
                  child: CircleAvatar(
                    radius: 2,
                    backgroundColor: Colors.green,
                  ),
                ),
                Align(
                  alignment: Alignment.bottomLeft,
                  widthFactor: 30,
                  heightFactor: 14,
                  child: CircleAvatar(
                    radius: 3,
                    backgroundColor: Colors.blueAccent,
                  ),
                ),
                Align(
                  alignment: Alignment.bottomLeft,
                  widthFactor: 25,
                  heightFactor: 13,
                  child: CircleAvatar(
                    radius: 6,
                    backgroundColor: Colors.pink,
                  ),
                ),
                Align(
                  alignment: Alignment.bottomLeft,
                  widthFactor: 24,
                  heightFactor: 18,
                  child: CircleAvatar(
                    radius: 7,
                    backgroundColor: Colors.blueAccent,
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height/2,
            width: MediaQuery.of(context).size.width,
            child: Stack(alignment: Alignment.center,
              children: [
                Align(
                  alignment: Alignment.topCenter,
                  child: Container(
                    height: 70,
                    width: 70,
                    decoration: BoxDecoration(
                        color: Colors.pink,
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                        image: DecorationImage(image: AssetImage("assets/birthdayrem/2a5f222e707f0782823d49cc7858cb28-removebg-preview.png"),fit: BoxFit.contain)
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.topLeft,
                  widthFactor: 1.5,
                  heightFactor: 2,
                  child: Container(
                    height: 70,
                    width: 70,
                    decoration: BoxDecoration(
                        color: Colors.greenAccent.shade700,
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                        image: DecorationImage(image: AssetImage("assets/birthdayrem/e48a561a4be1d2ec86b741fca40b202c-removebg-preview.png"),fit: BoxFit.contain)
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.topLeft,
                  widthFactor: 3,
                  heightFactor: 3,
                  child: Container(
                    height: 90,
                    width: 90,
                    decoration: BoxDecoration(
                        color: Colors.blueAccent,
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                        image: DecorationImage(image: AssetImage("assets/birthdayrem/235a3c903253a43f9d7a2bf42a0a0b75-removebg-preview.png"),fit: BoxFit.contain)
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.topRight,
                  widthFactor: 3.5,
                  heightFactor: 3.5,
                  child: Container(
                    height: 70,
                    width: 70,
                    decoration: BoxDecoration(
                        color: Colors.orange,
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                        image: DecorationImage(image: AssetImage("assets/birthdayrem/03749c99011f85a821b0931632cb5fd7-removebg-preview.png"),fit: BoxFit.contain)
                    ),
                  ),
                ),
                Align(
                    alignment: Alignment.topRight,
                    widthFactor: 3.5,
                    heightFactor: 6.5,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          elevation: 2,
                          backgroundColor: Colors.white,
                          shape: CircleBorder()
                      ),
                      onPressed: (){},
                      child: Icon(Icons.cake_outlined,color: Colors.blue,),
                    )
                ),
                Align(
                  alignment: Alignment.bottomLeft,
                  widthFactor: 1.2,
                  heightFactor: 2.1,
                  child: Container(
                    height: 90,
                    width: 90,
                    decoration: BoxDecoration(
                        color: Colors.pinkAccent.shade100,
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                        image: DecorationImage(image: AssetImage("assets/birthdayrem/cfa2fe21e42026d31fe1f788c00e39bf-removebg-preview.png"),fit: BoxFit.contain)
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomLeft,
                  widthFactor: 3.3,
                  heightFactor: 3.5,
                  child: Container(
                    height: 70,
                    width: 70,
                    decoration: BoxDecoration(
                        color: Colors.yellow,
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                        image: DecorationImage(image: AssetImage("assets/birthdayrem/bc6d96c605555c33bde3c45c39f79c2a-removebg-preview.png"),fit: BoxFit.contain)
                    ),
                  ),
                ),
                Align(
                    alignment: Alignment.bottomLeft,
                    widthFactor: 4.4,
                    heightFactor: 2,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          elevation: 2,
                          backgroundColor: Colors.white,
                          shape: CircleBorder()
                      ),
                      onPressed: (){},
                      child: Icon(Icons.messenger_outline,color: Colors.blue,),
                    )
                ),
                Align(
                  alignment: Alignment.bottomRight,
                  widthFactor: 3.2,
                  heightFactor: 3,
                  child: Container(
                    height: 70,
                    width: 70,
                    decoration: BoxDecoration(
                        color: Colors.lightBlue.shade300,
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                        image: DecorationImage(image: AssetImage("assets/birthdayrem/deecf66e6f0620cbe3b1343a8abbccb1-removebg-preview.png"),fit: BoxFit.contain)
                    ),
                  ),
                ),
                Align(
                    alignment: Alignment.bottomRight,
                    widthFactor: 4,
                    heightFactor: 2.5,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          elevation: 2,
                          backgroundColor: Colors.white,
                          shape: CircleBorder()
                      ),
                      onPressed: (){},
                      child: Icon(Icons.call_outlined,color: Colors.blue,),
                    )
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
