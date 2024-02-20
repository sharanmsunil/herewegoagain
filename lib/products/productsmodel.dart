class Product{
  String name;
  String price;
  String color;
  int count;
  String image;

  Product(
    this.name,
    this.price,
    this.color,
    this.count,
    this.image,
);
}

List<Product> productList =[
  Product("Apple", "\$100", "item1", 0, "assets/fruits/apple.png"),
  Product("Banana", "\$120", "item2", 0, "assets/fruits/banana.png"),
  Product("Blackberry", "\$150", "item3", 0, "assets/fruits/blackberry.png"),
  Product("Blueberry", "\$160", "item4", 0, "assets/fruits/blueberry.png"),
  Product("Grape", "\$110", "item5", 0, "assets/fruits/grape.png"),
  Product("Guava", "\$170", "item6", 0, "assets/fruits/guava.png"),
  Product("Kiwi", "\$140", "item7", 0, "assets/fruits/kiwi.png"),
  Product("Mango", "\$130", "item8", 0, "assets/fruits/mango.png"),
  Product("Orange", "\$80", "item9", 0, "assets/fruits/orange.png"),
  Product("Papaya", "\$70", "item10", 0, "assets/fruits/papaya.png"),
  Product("Passion\nFruit", "\$90", "item11", 0, "assets/fruits/passionfruit.png"),
  Product("Peach", "\$190", "item12", 0, "assets/fruits/peach.png"),
  Product("item13", "\$210", "item13", 0, "assets/fruits/watermelon.png"),
];