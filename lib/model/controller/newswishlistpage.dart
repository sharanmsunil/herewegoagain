import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:herewegoagain/model/controller/theme_provider.dart';


import 'package:provider/provider.dart';

import 'news_provider.dart';

class WishlistPage extends StatelessWidget {
  const WishlistPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text("WishList",style: TextStyle(color: Colors.white),),
        centerTitle: true,
        actions: [
          Consumer(builder: (context,ThemeProvider2 provider,child){
            return IconButton(onPressed: (){
              provider.switchTheme();
            }, icon: Icon(provider.darkTheme? Icons.dark_mode:Icons.light_mode));
          }),
        ],
      ),
      body: Consumer(builder:(context,NewsProvider newsProvider,child) {
        return ListView.builder(itemCount: newsProvider.wish_List_Product.length,itemBuilder: (context, index){
          var selectedProduct = newsProvider.wish_List_Product[index];
          return ListTile(
            title: Text(newsProvider.wish_List_Product[index].newshead),
            subtitle: Text(newsProvider.wish_List_Product[index].newssub),
            leading: Container(
              height: 100,
              width: 100,
              child: CachedNetworkImage(
                imageUrl: newsProvider.wish_List_Product[index].imageurl,
                fit: BoxFit.fill,
                placeholder: (context, url) => CircularProgressIndicator(),
                errorWidget: (context, url, error) => Icon(Icons.error),
              ),
            ),
            trailing: IconButton(
                onPressed: () {
                  if (!newsProvider.wish_List_Product
                      .contains(selectedProduct)) {
                    newsProvider.addToWishList(selectedProduct);
                  }else{
                    newsProvider.removeFromWishList(selectedProduct);
                  }
                },
                icon: Icon(
                  Icons.favorite,
                  color: newsProvider.wish_List_Product
                      .contains(selectedProduct)
                      ? Colors.red
                      : Colors.grey,
                )),
          );
        });
      }),
    );
  }
}
