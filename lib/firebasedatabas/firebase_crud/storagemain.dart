import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: FirebaseOptions(
          apiKey: "AIzaSyCUwkb08uLtLROE33_rTe3ALElHEQxm2mw",
          appId: "1:84119325761:android:88ed23bee302f25fdc0ac0",
          messagingSenderId: "",
          projectId: "lunaloom-865e1",
          storageBucket: "lunaloom-865e1.appspot.com"));
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: FireBaseCRUD(),
  ));
}

class FireBaseCRUD extends StatefulWidget {
  const FireBaseCRUD({super.key});

  @override
  State<FireBaseCRUD> createState() => _FireBaseCRUDState();
}

class _FireBaseCRUDState extends State<FireBaseCRUD> {
  final cname = TextEditingController();
  final cemail = TextEditingController();
  late CollectionReference _userCollection;

  @override
  void initState() {
    _userCollection = FirebaseFirestore.instance.collection("Users");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
            child: Text(
          "User Data",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        )),
        backgroundColor: Colors.green,
      ),
      body: StreamBuilder<QuerySnapshot>(
          stream: readUser(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Center(child: Text('Error ${snapshot.error}'));
            }
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            }
            final users = snapshot.data!.docs;
            return ListView.builder(itemCount: users.length,itemBuilder: (context,index){
              final user = users[index];
              final userId = user.id;
              final userName = user["Name"];
              final userEmail = user["Email"];
              return ListTile(
                title: Text('$userName',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
                subtitle: Text('$userEmail',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15)),
                trailing: Wrap(
                  children: [
                    IconButton(onPressed: (){
                      editUserData(userId);
                    }, icon: Icon(Icons.edit)),
                    IconButton(onPressed: (){
                      deleteUser(userId);
                    }, icon: Icon(Icons.delete)),
                  ],
                ),
              );
            });
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: () => createUser(),
        child: Icon(Icons.add_reaction_outlined),
      ),
    );
  }

  void createUser() {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Add User'),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  controller: cname,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(), hintText: 'Name'),
                ),
                SizedBox(
                  height: 10,
                ),
                TextField(
                  controller: cemail,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(), hintText: 'Email'),
                ),
              ],
            ),
            actions: [
              OutlinedButton(
                  onPressed: () => addUsertoDB(cname.text, cemail.text),
                  child: Text("Create User")),
              OutlinedButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text("Cancel")),
            ],
          );
        });
  }

  Future<void> addUsertoDB(String name, String email) async {
    return _userCollection.add({
      "Name": name,
      'Email': email,
    }).then((value) {
      print("User  Added Successfully");
      cname.clear();
      cemail.clear();
      Navigator.of(context).pop();
    }).catchError((error) {
      print("Failed to add data $error");
    });
  }

  ///read all the
  Stream<QuerySnapshot> readUser() {
    return _userCollection.snapshots();
  }

  void editUserData(String userId){
    var uname = TextEditingController();
    var uemail = TextEditingController();
     showModalBottomSheet(context: context, builder: (context){
      return Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: uname,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Name"
              ),
            ),
            SizedBox(height: 10,),
            TextField(
              controller: uemail,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Email"
              ),
            ),
            SizedBox(height: 10,),
            ElevatedButton(onPressed: (){
              updateUser(userId,uname.text,uemail.text);
              uname.clear();
              uemail.clear();
            }, child: Text("Update User"))
          ],
        ),
      );
    });
  }
  /// update user
  Future<void> updateUser(String userId,String uname,String uemail) async{
    var updatedvalues = {"Name":uname,"Email":uemail};
    return _userCollection.doc(userId).update(updatedvalues).then((value) {
      Navigator.of(context).pop();
      print("User data updated successfully");
    }).catchError((error){
      print("User data updation Failed");
    });
  }

  Future<void> deleteUser(var id) async{
    return _userCollection.doc(id).delete().then((value) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("User Deleted Successfully")));
    }).catchError((error){
      print("User deletion failed $error");
    });
  }
}
