import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'controller/news_provider.dart';
import 'controller/newswishlistpage.dart';
import 'controller/theme_provider.dart';

void main(){
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (context)=> ThemeProvider2()),
    ChangeNotifierProvider(create: (context) => NewsProvider())
  ],
    child: MyApp2(),),);
}

class MyApp2 extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
        theme: Provider.of<ThemeProvider2>(context).darkTheme
            ? ThemeData.dark()
            : ThemeData.light(),
        darkTheme: ThemeData.dark(),
      home: News_Home());
  }
}

class News_Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Consumer(builder: (context,ThemeProvider2 provider,child){
          return IconButton(onPressed: (){
            provider.switchTheme();
          }, icon: Icon(provider.darkTheme? Icons.dark_mode:Icons.light_mode));
        }),
        backgroundColor: Colors.blue,
        title: Text(
          "News (2064)",
          style: TextStyle(color: Colors.white),
        ),
        actions: [
          IconButton(onPressed: (){
            Navigator.of(context).push(MaterialPageRoute(builder: (context)=>WishlistPage()));
          }, icon: Consumer(builder: (context, NewsProvider provider, child){
            return Icon(Icons.favorite,color: provider.wish_List_Product.isNotEmpty? Colors.red: Colors.white,);
          }))
        ],
        centerTitle: true,
      ),
      body:
      Consumer<NewsProvider>(
          builder: (BuildContext context, NewsProvider newsProvider, Widget? child) {
        return ListView.builder(
            itemCount: newsProvider.product.length,
            itemBuilder: (context, index) {
              var selectedProduct = newsProvider.product[index];
              return ListTile(
                title: Text(newsProvider.product[index].newshead),
                subtitle: Text(newsProvider.product[index].newssub),
                leading: Container(
                  height: 100,
                  width: 100,
                  child: CachedNetworkImage(
                    imageUrl: newsProvider.product[index].imageurl,
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
