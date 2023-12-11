class ProductModel {
  int? id;
  String? title;
  dynamic price;
  String? description;
  String? category;
  String? image;

  ProductModel(
      {required this.category,
      required this.description,
      required this.id,
      required this.image,
      required this.price,
      required this.title});
  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
        category: json["category"],
        description: json["description"],
        id: json["id"],
        image: json["image"],
        price: json["price"],
        title: json["title"]);
  }
}
