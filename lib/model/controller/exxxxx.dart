import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../model/products.dart';


void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: News_Home1(),
  ));
}

class News_Home1 extends StatelessWidget {
  final List<Product> news =[
    Product(newshead: "The Morning After: Robot dog maker Boston Dynamics has a new owner", newssub: "Engadget", imageurl: "https://picsum.photos/250?image=9"),
    Product(newshead: "Gillmor Gang: Who Knew", newssub: "TechCrunch", imageurl: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTCvSavj5U7DFIcQxZ4XtVTXf4y0rg8zfUtcw&usqp=CAU"),
    Product(newshead: "Transmit Security raises \$543M Series A to kill off the password", newssub: "TechCrunch", imageurl: ""),
    Product(newshead: "Peloton's New Tread+ Problem Is a Reminder That You Don't Really Own Your Connected Gadgets", newssub: "Gizmodo", imageurl: ""),
    Product(newshead: "Antitrust: Business Updates: GoogleDraws E.UAntitrust Inquiry", newssub: "New York Times", imageurl: ""),
    Product(newshead: "Prime members can save over £200 on the Apple iPad Pro", newssub: "Mashable", imageurl: ""),
    Product(newshead: "This Apple Watch Series 6 is on sale at Walmart for only \$279 (!) this Prime Day", newssub: "Mashable", imageurl: ""),
    Product(newshead: "The Apple Watch Series 6 is on sale for £50 off this Prime Day", newssub: "Mashable", imageurl: ""),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: Text(
            "News (2064)",
            style: TextStyle(color: Colors.white),
          ),
          centerTitle: true,
        ),
        body: ListView.builder(
            itemCount: news.length,
            itemBuilder: (context, index) {
              //var selectedProduct = newsProvider.product[index];
              return ListTile(
                title: Text(news[index].newshead),
                subtitle: Text(news[index].newssub),
                leading: Container(
                  height: 100,
                  width: 100,
                  child: CachedNetworkImage(
                    imageUrl: news[index].imageurl,
                    fit: BoxFit.fill,
                    placeholder: (context, url) => CircularProgressIndicator(),
                    errorWidget: (context, url, error) => Icon(Icons.error),
                  ),
                ),
              );
            })
    );
  }
}
