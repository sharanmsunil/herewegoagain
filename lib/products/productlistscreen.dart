import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:herewegoagain/products/product_controller.dart';
import 'package:badges/badges.dart'as badges;
import 'package:herewegoagain/products/productlistview.dart';

final ProductController controller = Get.put(ProductController());

class ProductListScreen extends StatelessWidget {
  const ProductListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
      child: badges.Badge(
        badgeContent : Obx(() => Text(controller.itemCount.value.toString())),
        child : Icon(Icons.shopping_cart)
      ),onPressed: (){
        // Navigator.push(context, MaterialPageRoute(builder: controller.navigateToCartScreen));
      }),
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text("Item Cart",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
        centerTitle: true,
      ),
      body: ProductListView(),
    );
  }
}
