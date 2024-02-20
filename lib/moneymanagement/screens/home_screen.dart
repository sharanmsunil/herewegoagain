import 'package:flutter/material.dart';

import '../model/money_model.dart';

void main(){
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Money_Home(),
  ));
}
class Money_Home extends StatefulWidget {
  const Money_Home({super.key});

  @override
  State<Money_Home> createState() => _Money_HomeState();
}

class _Money_HomeState extends State<Money_Home> {
  final List<Money>list1 = [
    Money("assets/moneymanagement/Nike-Logo.png", "NIKE SHOP", "17 Oct",
        "-62.94 \$"),
    Money("assets/moneymanagement/starbucks_logo.jpeg", "STARBUCKS", "17 Oct",
        "-6.00 \$"),
    Money("assets/moneymanagement/anna.jpeg", "Anna Johnson", "14 Oct",
        "50.00 \$"),
    Money("assets/moneymanagement/savings.jpeg", "From SAVINGS", "3 Oct",
        "-25.00 \$"),
  ];
  final List<Money>list2 = [
    Money("assets/moneymanagement/McDonald's_logo.svg.png", "McDonals's",
        "17 Oct", "-12.37 \$"),
    Money("assets/moneymanagement/Nike-Logo.png", "NIKE SHOP", "17 Oct",
        "-62.94 \$"),
    Money("assets/moneymanagement/starbucks_logo.jpeg", "STARBUCKS", "17 Oct",
        "-6.00 \$"),
    Money("assets/moneymanagement/anna.jpeg", "Anna Johnson", "14 Oct",
        "50.00 \$"),
    Money("assets/moneymanagement/savings.jpeg", "From SAVINGS", "3 Oct",
        "-25.00 \$"),
  ];
  bool ontapped =false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),),
        actions: [
          CircleAvatar(
              backgroundImage: AssetImage("assets/moneymanagement/anna.jpeg")
          ),
          IconButton(onPressed: () {},
              icon: Icon(Icons.more_horiz_outlined, color: Colors.black,))
        ],
      ),
      // endDrawer: Drawer(),
      body:
      SingleChildScrollView(
        //physics: ScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Theme(
                data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
                child: ExpansionTile(
                  title: Row(
                    children: [
                      Text('Main Account',style: TextStyle(color: Colors.purple.shade800,fontWeight: FontWeight.bold),),
                      SizedBox(width: 10,),
                      Icon(Icons.arrow_downward,size: 18,color: Colors.purple.shade800,)
                    ],
                  ),
                  trailing: SizedBox.shrink(),
                  children: <Widget>[
                    ListTile(
                        title: Text(ontapped == true? '13.458 \$' : "**.*** \$",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 20),),
                    trailing: SizedBox.shrink(),

                    subtitle: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        InkWell(
                            onTap: (){
                              setState(() {
                                if(ontapped == false){
                                  setState(() {
                                    ontapped = true;
                                  });
                                }else if (ontapped == true){
                                  setState(() {
                                    ontapped = false;
                                  });
                                }
                              });
                            },
                            child: Icon(ontapped == true?Icons.visibility : Icons.visibility_off,color: Colors.grey,size: 15,)),
                        SizedBox(width: 5,),
                        Text("Current balance",style: TextStyle(color: Colors.grey,fontSize: 12),)
                      ],
                    ),),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.purple.shade200,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(Radius.circular(
                                    5))),
                            minimumSize: Size(30, 40)
                        ),
                        onPressed: () {},
                        child: Icon(Icons.add, color: Colors.black, size: 15,)),
                    Spacer(),
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.purple.shade200,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(Radius.circular(
                                    5))),
                            minimumSize: Size(30, 40)
                        ),
                        onPressed: () {},
                        child: Icon(
                          Icons.arrow_forward, color: Colors.black, size: 15,)),
                    Spacer(),
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.purple.shade100,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(Radius.circular(
                                    5))),
                            minimumSize: Size(200, 40)
                        ),
                        onPressed: () {},
                        child: Text("Split a purchase", style: TextStyle(
                            color: Colors.purple.shade700,
                            fontWeight: FontWeight.bold),)),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 5),
                child: Text("Recent events", style: TextStyle(
                    color: Colors.black, fontWeight: FontWeight.bold),),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 5),
                child: ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: list1.length,
                    itemBuilder: (BuildContext context, int index) {
                      return
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 5),
                          child: Container(
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.grey.shade300),
                                borderRadius: BorderRadius.all(
                                    Radius.circular(5))
                            ),
                            child: ListTile(
                              leading: Container(
                                height: 100,
                                width: 50,
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: AssetImage(list1[index].image,),
                                      fit: BoxFit.contain,)
                                ),),
                              title: Text(list1[index].name, style: TextStyle(
                                  color: Colors.black, fontSize: 15),),
                              subtitle: Text(list1[index].date,
                                style: TextStyle(
                                    color: Colors.grey, fontSize: 10),),
                              trailing: Text(list1[index].price,
                                style: TextStyle(
                                    color: Colors.black, fontSize: 15),),
                            ),
                          ),
                        );
                    }),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 5),
                child: Text("Recent events", style: TextStyle(
                    color: Colors.black, fontWeight: FontWeight.bold),),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 5),
                child: ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: list2.length,
                    itemBuilder: (BuildContext context, int index) {
                      return
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 5),
                          child: Container(
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.grey.shade300),
                                borderRadius: BorderRadius.all(
                                    Radius.circular(5))
                            ),
                            child: ListTile(
                              leading: Container(
                                height: 100,
                                width: 50,
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: AssetImage(list2[index].image,),
                                      fit: BoxFit.contain,)
                                ),),
                              title: Text(list2[index].name, style: TextStyle(
                                  color: Colors.black, fontSize: 15),),
                              subtitle: Text(list2[index].date,
                                style: TextStyle(
                                    color: Colors.grey, fontSize: 10),),
                              trailing: Text(list2[index].price,
                                style: TextStyle(
                                    color: Colors.black, fontSize: 15),),
                            ),
                          ),
                        );
                    }),
              )
            ],
          ),
        ),
      ),
    );
  }
}


