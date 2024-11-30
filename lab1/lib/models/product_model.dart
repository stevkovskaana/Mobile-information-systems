class Product {
  String name;
  String img;
  String description;
  double price;

  Product(
      {required this.name,
      required this.img,
      required this.description,
      required this.price});

  Product.fromJson(Map<String, dynamic> data)
      : name = data['name'],
        img = data['img'],
        description = data['description'],
        price = data['price'];

  Map<String, dynamic> toJson() =>
      {'name': name, 'img': img, 'description': description, 'price': price};
}
