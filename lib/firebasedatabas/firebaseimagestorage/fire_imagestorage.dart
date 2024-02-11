import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart' as path;

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
    home: MediaStorage(),
  ));
}

class MediaStorage extends StatefulWidget {
  const MediaStorage({super.key});

  @override
  State<MediaStorage> createState() => _MediaStorageState();
}

class _MediaStorageState extends State<MediaStorage> {
  FirebaseStorage storage = FirebaseStorage.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        excludeHeaderSemantics: true,
        title: Center(child: Text("Media Storage",style: TextStyle(color: Colors.white),)),
        backgroundColor: Colors.deepPurple,
        actions: [IconButton(onPressed: ()=>upload("Camera"), icon: Icon(Icons.camera,color: Colors.white,))],
      ),
      body: Padding(padding: EdgeInsets.all(10),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton.icon(onPressed: ()=>upload("Camera"), icon: Icon(Icons.camera), label: Text('Camera') ),
              ElevatedButton.icon(onPressed: ()=>upload("Gallery"), icon: Icon(Icons.photo), label: Text('Gallery') ),
            ],
          ),
          Expanded(child: FutureBuilder(future: loadMedia(), builder: (context,snapshot){
            if(snapshot.connectionState == ConnectionState.done){
              return ListView.builder(itemCount: snapshot.data?.length,itemBuilder: (context,index){
                final Map<String,dynamic> image = snapshot.data![index];
                return Card(
                  child: ListTile(
                    leading: Image.network(image['imageUrl']),
                    title: Text(image['credit']),
                    subtitle: Text(image['date']),
                    trailing: IconButton(onPressed: ()async{
                      await storage.ref(image['path']).delete();
                      setState(() {

                      });
                    }, icon: Icon(Icons.delete)),
                  ),
                );
              });
            }
            return CircularProgressIndicator();
          }))
        ],
      ),),
    );
  }

  Future<void> upload(String imgSource) async{
    final picker = ImagePicker();  //object of image picker
    XFile? pickedImage; //to store image
    try{
      pickedImage = await picker.pickImage(source: imgSource == "Camera" ? ImageSource.camera : ImageSource.gallery);
      final String fileName= path.basename(pickedImage!.path);
      File imageFile = File(pickedImage.path);
      try{
        await  storage.ref(fileName).putFile(imageFile,SettableMetadata(customMetadata: {
          'pic_credit' : "Someone 😇",
          'data' : "05/02/2024"
        }));
        setState(() {});
      }on FirebaseException catch(e){
        print(e);
    }
    }catch(error){
      print(error);
    }
  }

 Future<List<Map<String,dynamic>>> loadMedia() async{
    List<Map<String,dynamic>> images =[];
    final ListResult result = await storage.ref().list();
    final List<Reference> allfiles = result.items;
    await Future.forEach(allfiles, (singleFile) async{
      final String fileUrl = await singleFile.getDownloadURL();
      final FullMetadata metadata = await singleFile.getMetadata();
      images.add({
        'imageUrl' : fileUrl,
        'path' :  singleFile.fullPath,
        'credit' : metadata.customMetadata!['pic_credit'] ?? "No Data",
        'date' : metadata.customMetadata!['date'] ?? "No Date Available",
      });
    });
    return images;
 }

}
