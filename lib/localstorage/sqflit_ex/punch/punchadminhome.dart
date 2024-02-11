import 'package:flutter/material.dart';
import 'package:herewegoagain/localstorage/sqflit_ex/punch/punchdbfunction.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

class AdminHome extends StatefulWidget {
  const AdminHome({super.key});

  @override
  State<AdminHome> createState() => _AdminHomeState();
}

class _AdminHomeState extends State<AdminHome> {
  var userdetails = [];
  final cusername = TextEditingController();
  final cemail = TextEditingController();
  final cphnnum = TextEditingController();

  @override
  void initState() {
    loadDetails();
    super.initState();
  }

  Future<void> loadDetails() async {
    final usd = await SQL_Functions.getAllUsers();
    setState(()  {
      userdetails = usd;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(
                      'assets/images/abstract-brown-wavy-lines-background-ai-generated-free-photo.jpg'),
                  fit: BoxFit.cover)),
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
                 children: [
                   SizedBox(height: 60,),
                   GradientText(
                     'PUNCH',
                     style: TextStyle(fontSize: 40.0, fontWeight: FontWeight.bold),
                     //gradientType: GradientType.radial,
                     colors: [
                       Colors.pink,
                       Colors.purple,
                       Colors.blueAccent,
                       Colors.lightBlue,
                     ],
                   ),
                   SizedBox(
                     height: 10,
                   ),
                   RichText(
                     text: TextSpan(
                       text: 'Punch',
                       style: TextStyle(
                           fontSize: 20,
                           color: Colors.pink,
                           fontWeight: FontWeight.bold),
                       children: const <TextSpan>[
                         TextSpan(
                             text: ' • ',
                             style: TextStyle(fontSize: 20, color: Colors.black)),
                         TextSpan(
                             text: 'Earn',
                             style:
                             TextStyle(fontSize: 20, color: Colors.blueAccent)),
                         TextSpan(
                             text: ' • ',
                             style: TextStyle(fontSize: 20, color: Colors.black)),
                         TextSpan(
                             text: 'Repeat',
                             style:
                             TextStyle(fontSize: 20, color: Colors.lightBlue)),
                       ],
                     ),
                   ),
                   SizedBox(height: 20,),
                   Text('Admin Page',style: TextStyle(
                       color: Colors.white,
                       fontSize: 40,
                       fontWeight: FontWeight.bold),),
                   Text('User Details',style: TextStyle(
                       color: Colors.white,
                       fontSize: 20,
                       fontWeight: FontWeight.bold),),
                   SizedBox(height: 20,),
                   SingleChildScrollView(
                     child: Column(
                       children:
                         List.generate(
                           userdetails.length,
                           // gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                           //     crossAxisCount: 2,),
                             (index)=> Container(
                               height: MediaQuery.of(context).size.height/3,
                               width: MediaQuery.of(context).size.width,
                               margin: EdgeInsets.symmetric(horizontal: 50,vertical: 10),
                               decoration: BoxDecoration(
                                 borderRadius: BorderRadius.all(Radius.circular(20)),
                                 color: Color(0xFFE1AC54),
                               ),
                               child: Column(
                                 mainAxisAlignment: MainAxisAlignment.center,
                                 children: [
                                   Icon(
                                     Icons.person_2_outlined,
                                     color: Colors.white,
                                     size: 20,
                                   ),
                                   SizedBox(
                                     height: 20,
                                   ),
                                   Text(
                                     "Name : ${userdetails[index]['name']}",
                                     style: TextStyle(
                                         fontSize: 12,
                                         fontWeight: FontWeight.bold,
                                         color: Colors.white),
                                   ),
                                   SizedBox(
                                     height: 10,
                                   ),
                                   Text(
                                     "Email : ${userdetails[index]['email']}",
                                     style: TextStyle(
                                         fontSize: 12,
                                         fontWeight: FontWeight.bold,
                                         color: Colors.white),
                                   ),
                                   SizedBox(
                                     height: 10,
                                   ),
                                   Text(
                                     "PhoneNum : ${userdetails[index]['phnnum']}",
                                     style: TextStyle(
                                         fontSize: 12,
                                         fontWeight: FontWeight.bold,
                                         color: Colors.white),
                                   ),
                                   SizedBox(
                                     height: 10,
                                   ),
                                   Wrap(
                                     children: [
                                       IconButton(
                                           onPressed: () => editdetails(userdetails[index]['id']), icon: Icon(Icons.edit,color: Colors.white,)),
                                       IconButton(
                                           onPressed: () async{
                                             await SQL_Functions.dltUser(userdetails[index]['id']);
                                             loadDetails();
                                           }, icon: Icon(Icons.delete,color: Colors.white,)),
                                     ],
                                   )
                                 ],
                               ),
                             )
                         ),
                     ),
                   ),
                 ],
               ),
          ),
        ),
      )
    );
  }

  void editdetails(int? id) async{
    if(id != null){
      final existingData = userdetails.firstWhere((element) => element['id'] == id);
      cusername.text = existingData['name'];
      cemail.text = existingData['email'];
      cphnnum.text = existingData['phnnum'];

    }
    showModalBottomSheet(
      isScrollControlled: true,
        context: context,
        builder: (context){
        return Container(
          padding: EdgeInsets.only(
              top: 15,
              left: 15,
              right: 15,
              bottom: MediaQuery.of(context).viewInsets.bottom + 120),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                height: 15,
              ),
              TextField(
                controller: cusername,
                decoration: InputDecoration(
                    border: OutlineInputBorder(), hintText: "Title"),
              ),
              SizedBox(
                height: 15,
              ),
              TextField(
                controller: cemail,
                decoration: InputDecoration(
                    border: OutlineInputBorder(), hintText: "Title"),
              ),
              SizedBox(
                height: 15,
              ),
              ElevatedButton(
                  onPressed: () {
                    if (id != null) {
                      updateUserDetails(id,cusername.text,cemail.text);
                      cusername.text = "";
                      cemail.text = "";
                      Navigator.of(context).pop();
                    }
                  },
                  child: Text("Update Details",style: TextStyle(color: Colors.black),))
            ],
          ),
        );
        });
  }

  Future<void> updateUserDetails(int id, String uname, String uemail) async{
    await SQL_Functions.update(id, uname, uemail);
    loadDetails();
  }
}
