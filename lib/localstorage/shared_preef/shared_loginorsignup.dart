import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:herewegoagain/localstorage/shared_preef/shared_Signup.dart';
import 'package:herewegoagain/localstorage/shared_preef/shared_pref_ex.dart';

class Shared_lo_Si extends StatelessWidget {
  const Shared_lo_Si({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff171a4d),
      body: Column(
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
          SizedBox(height: 20,),
          Text(
            'HI THERE',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30,color: Colors.white),
          ),
          Text(
            'Please Select a Option',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 10,color: Colors.grey),
          ),
          SizedBox(height: 100,),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: ElevatedButton(
              onPressed: ()  {
                Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Shared_Login()));
              },
              child: Text('Login',style: TextStyle(color: Colors.white),),
              style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xff019dfe),
                  minimumSize: Size(150, 50),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10)))
              ),),
          ),Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: ElevatedButton(
              onPressed: ()  {
                Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Shared_Signup()));
              },
              child: Text('SignUp',style: TextStyle(color: Colors.white),),
              style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xff019dfe),
                  minimumSize: Size(150, 50),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10)))
              ),),
          ),
          SizedBox(height: 50,),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FaIcon(FontAwesomeIcons.facebook,color: Colors.white,),
                SizedBox(width: 5,),
                FaIcon(FontAwesomeIcons.instagram,color: Colors.white,),
                SizedBox(width: 5,),
                FaIcon(FontAwesomeIcons.youtube,color: Colors.white,),
                SizedBox(width: 5,),
                FaIcon(FontAwesomeIcons.twitter,color: Colors.white,),
              ],
            ),
          )
        ],
      ),
    );
  }
}
