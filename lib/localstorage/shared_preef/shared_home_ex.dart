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
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Welcome $username',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 30),),
            SizedBox(height: 20,),
            ElevatedButton(onPressed: ()async{
              preferences = await SharedPreferences.getInstance();
              preferences.setBool("newUser", true);
              Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Shared_Login()));
            }, child: Text('LogOut'))
          ],
        ),
      ),
    );
  }

}
