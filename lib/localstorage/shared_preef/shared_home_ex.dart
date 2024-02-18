import 'package:flutter/material.dart';
import 'package:herewegoagain/localstorage/shared_preef/shared_pref_ex.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Shared_Home extends StatefulWidget {
  const Shared_Home({super.key});

  @override
  State<Shared_Home> createState() => _Shared_HomeState();
}

class _Shared_HomeState extends State<Shared_Home> {
  late SharedPreferences preferences;
  late String username;

  @override
  void initState() {
    fetchData();
    super.initState();
  }
  Future<void> fetchData() async{
    preferences = await SharedPreferences.getInstance();
    setState(() {
      username = preferences.getString("Email")!;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: MediaQuery.of(context).size.height/2.5,
                width: MediaQuery.of(context).size.width,
                child: Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 50),
                      child: Container(
                        height: double.infinity,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            color: Color(0xff3d49c0),
                            borderRadius: BorderRadius.only(bottomLeft: Radius.circular(200),bottomRight: Radius.circular(200))
                        ),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                          image: DecorationImage(image:
                          AssetImage("assets/images/women-homeo-cure-clinic-1024x1024.png"))
                      ),
                    )
                  ],
                ),
              ),
              Text(
                'WELCOME BUDDY',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30,color: Colors.white),
              ),
              //Text('Welcome $username',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 30),),
              SizedBox(height: 20,),
              ElevatedButton(onPressed: ()async{
                preferences = await SharedPreferences.getInstance();
                preferences.setBool("newUser", true);
                Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Shared_Login()));
              }, child: Text('LogOut'))
            ],
          ),
        ),
      ),
    );
  }

}
