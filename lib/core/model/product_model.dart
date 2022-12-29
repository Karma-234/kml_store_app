class ProductModel {
  String? imgUrl;
  String? title;
  String? description;
  String? price;
  String? quantity;
  String? id;

  ProductModel({
    this.imgUrl,
    this.price,
    this.description,
    this.title,
    this.id,
    this.quantity,
  });
  ProductModel fromJson(Map json) {
    return ProductModel(
      description: json['description'],
      imgUrl: json['image'],
      price: json['price'] as String,
      title: json['title'],
    );
  }

  Map<String, dynamic> toJson() => {
        'description': description,
        'image': imgUrl,
        'price': price,
        'title': title
      };
}
