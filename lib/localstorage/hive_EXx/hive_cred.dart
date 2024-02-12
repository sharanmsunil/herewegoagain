import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';

void main()async{
  await Hive.initFlutter();
  await Hive.openBox('todo');
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: HiveTodo(),
  ));
}
class HiveTodo extends StatefulWidget {
  const HiveTodo({super.key});

  @override
  State<HiveTodo> createState() => _HiveTodoState();
}

class _HiveTodoState extends State<HiveTodo> {
  final ctitle = TextEditingController();
  final ccontent = TextEditingController();
  final todo_box = Hive.box('todo');
  var mytasks=[];
  @override
  void initState() {
    load_or_rear_Task();
    super.initState();
  }
  void load_or_rear_Task() async{
    final task_from_hive = todo_box.keys.map((e) {
      //get all the keys from hive in ascending order
      final value = todo_box.get(e);
      return{
        'id' : e,
        'head' : value['title'],
        'desc' : value['content']
      };
    }).toList();
    setState(() {
      mytasks = task_from_hive.reversed.toList();
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Hive Todo"),
        centerTitle: true,
        actions: [
          IconButton(onPressed: ()=> createDialog(null), icon: Icon(Icons.add))
        ],
      ),
      body: mytasks.isEmpty? Center(child: CircularProgressIndicator(color: Colors.green,),) :
          ListView.builder(
              itemCount: mytasks.length,
              itemBuilder: (context,index){
            return Card(
              child: ListTile(
                leading: Text("${mytasks[index]['id']}"),
                title: Text(mytasks[index]['head']),
                subtitle: Text(mytasks[index]['desc']),
                trailing: Wrap(
                  children: [
                    IconButton(onPressed: (){
                      createDialog(mytasks[index]['id']);
                    }, icon: Icon(Icons.edit)),
                    IconButton(onPressed: ()async{
                      await todo_box.delete(mytasks[index]['id']);
                      load_or_rear_Task();
                    }, icon: Icon(Icons.delete)),
                  ],
                ),

              ),
            );
          })
    );
  }

 void createDialog(int? key) {
    if (key!=null){
     final  existingTask =mytasks.firstWhere((element) => element["id"] == key);
     ctitle.text=existingTask['head'];
     ccontent.text=existingTask['desc'];
    }
    showDialog(context: context, builder: (context){
     return AlertDialog(
        title: Text(key == null? "Create Task" : "Update Task"),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: ctitle,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Title"
              ),
            ),
            TextField(
              controller: ccontent,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Content"
              ),
            ),
          ],
        ),
        actions: [
          TextButton(onPressed: (){
            if(key == null){
              createTask({
                "title": ctitle.text,
                'content': ccontent.text,
              } );
              ctitle.clear();
              ccontent.clear();
            }
            if(key != null){
              updateTask(key,{
                'title' : ctitle.text,
                'content' : ccontent.text
              });
              ctitle.clear();
              ccontent.clear();
            }
          }, child: Text(key == null ?"Create":"Update")),
          TextButton(onPressed: (){
            Navigator.of(context).pop();
          }, child: Text("Cancel")),
        ],
      );
    });
 }


  Future<void> createTask(Map<String,dynamic> task) async{
    await todo_box.add(task);
    load_or_rear_Task();
    Navigator.of(context).pop();
  }

  Future<void> updateTask(int key , Map<String,String> uptask) async{
    await todo_box.put(key,uptask);
    load_or_rear_Task();
    Navigator.of(context).pop();
  }
}



