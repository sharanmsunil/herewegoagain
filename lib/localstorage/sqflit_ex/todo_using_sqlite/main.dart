import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import 'dbFunction.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: MyToDo(),
  ));
}

class MyToDo extends StatefulWidget {
  const MyToDo({super.key});

  @override
  State<MyToDo> createState() => _MyToDoState();
}

class _MyToDoState extends State<MyToDo> {
  final ctitle = TextEditingController();
  final ccontent = TextEditingController();
  bool isLoading = true;
  var tasks = []; //to store task sqflite returned by readtask method

  @override
  void initState() {
    loadTask();
    super.initState();
  }

  Future<void> loadTask() async {
    final tsk = await SQLhelper.readTask();
    setState(() {
      tasks = tsk;
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('ToDO')),
      ),
      body: isLoading
          ? Center(child: 
      // Image.asset('assets/gif/dont-touch-me.gif')
        Lottie.asset('assets/gif/Animation - 1707295194879.json')
      )
          : Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Text(
                    "MY Task",
                    style: TextStyle(
                        fontSize: 15,
                        fontStyle: FontStyle.normal,
                        color: Colors.purple),
                  ),
                ),
                Expanded(
                    child: GridView.builder(
                      itemCount: tasks.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    crossAxisCount: 2,
                  ),
                  itemBuilder: (context, index) {
                    return Card(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Icon(
                            Icons.calendar_today_outlined,
                            color: Colors.purple,
                            size: 20,
                          ),
                          SizedBox(height: 10,),
                          Text(
                            tasks[index]['title'],
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.purple),
                          ),
                          SizedBox(height: 10,),
                          Text(
                            tasks[index]['content'],
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.purple),
                          ),
                          SizedBox(height: 30,),
                          Wrap(children: [
                            IconButton(onPressed: () => showSheet(tasks[index]['id']), icon: Icon(Icons.edit)),
                            IconButton(onPressed: ()async{
                              await SQLhelper.deleteTask(tasks[index]['id']);
                              loadTask();
                            }, icon: Icon(Icons.delete)),
                          ],)
                        ],
                      ),
                    );
                  },
                ))
              ],
            ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => showSheet(null), label: Text('Create Task'),
        // child: Icon(Icons.add),
      ),
    );
  }

  void showSheet(int? id) async {
    if(id != null){
      final existingData = tasks.firstWhere((element) => element['id'] == id);
      ctitle.text = existingData['title'];
      ccontent.text = existingData['content'];
    }
    showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        builder: (context) {
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
                  controller: ctitle,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(), hintText: "Title"),
                ),
                SizedBox(
                  height: 15,
                ),
                TextField(
                  controller: ccontent,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(), hintText: "Title"),
                ),
                SizedBox(
                  height: 15,
                ),
                ElevatedButton(
                    onPressed: () {
                      if (id == null) {
                        createTask();
                        ctitle.text = "";
                        ccontent.text = "";
                        Navigator.of(context).pop();
                      }
                      if (id != null) {
                        updateTask(id,ctitle.text,ccontent.text);
                        ctitle.text = "";
                        ccontent.text = "";
                        Navigator.of(context).pop();
                      }
                    },
                    child: Text(id == null ? "Create Task" : "Update Task"))
              ],
            ),
          );
        });
  }

  Future<void> createTask() async {
    var id = await SQLhelper.create(ctitle.text, ccontent.text);
    print(id);
    loadTask();
  }

  Future<void> updateTask(int id, String utitle, String ucontent) async{
    await SQLhelper.update(id, utitle, ucontent);
    loadTask();
  }
}
