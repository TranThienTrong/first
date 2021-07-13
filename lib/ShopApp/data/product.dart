class Product {
  late final String id;
  late final String title;
  late final String desc;
  late final double price;
  late final String imageUrl;
  bool isFavourite;


  Product({required this.id, required this.title, required this.desc, required this.price, required this.imageUrl, this.isFavourite = false});


}
