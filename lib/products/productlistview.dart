import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:herewegoagain/products/product_controller.dart';
import 'package:herewegoagain/products/productdetailpage.dart';
import 'package:herewegoagain/products/productsmodel.dart';


final ProductController controller = Get.put(ProductController());

class ProductListView extends StatelessWidget {
Widget countButton(int index, void Function(int index) counter,
{IconData? icon}){
  return RawMaterialButton(
  onPressed: (){
    counter(index);
  },
   elevation: 2.0,
   fillColor: Colors.white,
   child: Icon(
   icon,
   size: 15,),
   shape: CircleBorder(),);
}
  @override
  Widget build(BuildContext context) {
    Widget listViewBody(Product item, int index) {
      return GestureDetector(
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (_){
            return ProductDetailScreen(item.name,item.image);
          },));
        },
        child: Card(
          child: Row(
            children: [
              SizedBox(width: 20,),
              Image.asset(item.image,fit: BoxFit.contain,width: 60,),
              SizedBox(width: 20,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(item.name,style: TextStyle(),),
                  Text(item.price,style: TextStyle(),),
                  Text(item.color,style: TextStyle(),),
                ],
              ),
              Spacer(),
              Row(
                children: [
                  countButton(index, controller.increase, icon: Icons.add),
                  Obx(() => Text(controller.allProducts[index].count.toString())),
                  countButton(index, controller.decrease, icon: Icons.remove)
                ],
              )
            ],
          ),
        ),
      );
    }
    return ListView.builder(
      padding: EdgeInsets.all(15),
        itemCount: controller.allProducts.length,
        itemBuilder: (_, index){
        Product item = controller.allProducts[index];
        if(controller.isItemListScreen){
          return listViewBody(item, index);
        } else if (controller.isCartScreen && item.count > 0) {
          return listViewBody(item, index);
        } else {
          return Container(
            color: Colors.red,
          );
        }
    });
  }
}
