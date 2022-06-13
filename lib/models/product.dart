class Product {
  int id;
  String category;
  String name;
  String price;
  String imageUrl;

  Product({
    this.id = 0,
    this.category = '',
    this.imageUrl = '',
    this.name = '',
    this.price = '',
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
        id: json['id'],
        name: json['name'],
        category: json['category'],
        price: json['price'],
        imageUrl: json["imageUrl"]);
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "name": name,
      "category": category,
      "price": price,
      "imageUrl": imageUrl,
    };
  }
}
