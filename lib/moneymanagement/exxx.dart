import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Home_Screen(),
  ));
}

class Home_Screen extends StatelessWidget {
  final List<Homemodel> list1=[
    Homemodel(Icons.home, "Home",Colors.green.shade300),
    Homemodel(Icons.water, "Water",Colors.yellow.shade700),
    Homemodel(Icons.credit_card, "CreditCard",Colors.lightBlue),
    Homemodel(Icons.wifi, "Wifi",Colors.purple.shade300),
    Homemodel(Icons.cast_for_education, "Education",Colors.pinkAccent),
    Homemodel(Icons.sports, "Sports",Colors.blueAccent),
    Homemodel(Icons.health_and_safety, "Health",Colors.greenAccent),
    Homemodel(Icons.phone, "Phone",Colors.purple),
    Homemodel(Icons.settings, "Settings",Colors.orange),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            children: [
              Row(
                children: [
                  CircleAvatar(
                    backgroundImage:
                        AssetImage('assets/moneymanagement/anna.jpeg'),
                    maxRadius: 40,
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Hi Imruz 👋",
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 20),
                      ),
                      Text("April 5")
                    ],
                  ),
                  Spacer(),
                  IconButton(
                      onPressed: () {}, icon: Icon(FontAwesomeIcons.bell))
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Text("Please add your first Bill",
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 20)),
              SizedBox(
                height: 10,
              ),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFF4058DD),
                      minimumSize: Size(250, 50)),
                  onPressed: () {},
                  child: Text(
                    "+ Add bill",
                    style: TextStyle(color: Colors.white),
                  )),
              SizedBox(
                height: 20,
              ),
              Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 15),
                    child: Text(
                      'Categories',
                      style: TextStyle(
                          color: Colors.grey,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    ),
                  )),
              SizedBox(
                height: 20,
              ),
              Expanded(
                child: GridView(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        mainAxisSpacing: 5,
                        crossAxisSpacing: 5),
                children: 
                  List.generate(list1.length, (index) => Column(
                    children: [
                      InkWell(
                        onTap: (){},
                        child: Container(
                          height: 60,
                            width: 60,
                          decoration: BoxDecoration(
                            color: list1[index].colorname,
                            borderRadius: BorderRadius.all(Radius.circular(10))
                          ),
                          child: Icon(list1[index].icon,color: Colors.white,),
                        ),
                      ),
                      SizedBox(height: 5,),
                      Text(list1[index].name,style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),)
                    ],
                  )),),
              )
            ],
          ),
        ),
      ),
    );
  }
}


class Homemodel{
  IconData icon;
  String name;
  Color colorname;
  Homemodel(
    this.icon,
    this.name,
    this.colorname
  );
}