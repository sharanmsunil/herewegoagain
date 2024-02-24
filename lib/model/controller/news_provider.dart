import 'package:flutter/material.dart';
import '../products.dart';

final List<Product> products =[
  Product(newshead: "The Morning After: Robot dog maker Boston Dynamics has a new owner", newssub: "Engadget", imageurl: "https://picsum.photos/250?image=9"),
  Product(newshead: "Gillmor Gang: Who Knew", newssub: "TechCrunch", imageurl: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTCvSavj5U7DFIcQxZ4XtVTXf4y0rg8zfUtcw&usqp=CAU"),
  Product(newshead: "Transmit Security raises \$543M Series A to kill off the password", newssub: "TechCrunch", imageurl: "https://images.pexels.com/photos/2899097/pexels-photo-2899097.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500"),
  Product(newshead: "Peloton's New Tread+ Problem Is a Reminder That You Don't Really Own Your Connected Gadgets", newssub: "Gizmodo", imageurl: "https://images.pexels.com/photos/2820884/pexels-photo-2820884.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500"),
  Product(newshead: "Antitrust: Business Updates: GoogleDraws E.UAntitrust Inquiry", newssub: "New York Times", imageurl: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT3ZFVlexmKnp8RS3sFN_ANnD6GJRWBpwiDow&usqp=CAU"),
  Product(newshead: "Prime members can save over £200 on the Apple iPad Pro", newssub: "Mashable", imageurl: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ9yH3YNnEdHiv6Xg8zZiwafGcgTK_t_HKAvw&usqp=CAU"),
  Product(newshead: "This Apple Watch Series 6 is on sale at Walmart for only \$279 (!) this Prime Day", newssub: "Mashable", imageurl: ""),
  Product(newshead: "The Apple Watch Series 6 is on sale for £50 off this Prime Day", newssub: "Mashable", imageurl: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRlkygQ3A-ZSSVJzex8RUIXfh1ilIG0LJ83iw&usqp=CAU"),
];
class NewsProvider extends ChangeNotifier{
  final List<Product> _products = products;
  List<Product> get product => _products;

  final List<Product> _wishlist = [];
  List<Product> get wish_List_Product => _wishlist;

  void addToWishList(Product selectedProduct) {
    _wishlist.add(selectedProduct);
    print(_wishlist);
    notifyListeners();
  }

  void removeFromWishList(Product selectedProduct) {
    _wishlist.remove(selectedProduct);
    print(_wishlist);
    notifyListeners();
  }


}