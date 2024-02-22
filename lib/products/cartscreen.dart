import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:herewegoagain/products/productlistview.dart';

class CartScreen extends StatelessWidget {

  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: IconButton(onPressed: (){
          Navigator.of(context).pop();
        }, icon: Icon(Icons.arrow_back,color: Colors.white,)),
        backgroundColor: Colors.black,
        title: Text("Cart",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
        centerTitle: true,
      ),
      body: 
      Column(
        children: [
          Expanded(child: ProductListView()),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text("Total",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
              Obx(() => Text('${controller.price.value}',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold))),
            ],
          )
        ],
      ),
    );
  }
}
