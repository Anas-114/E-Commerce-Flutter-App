class ProductModel {
  final String title;
  final double price;
  final String description;
  final String category;
  final String image;

  ProductModel({
    required this.title,
    required this.price,
    required this.description,
    required this.category,
    required this.image,
  });

  factory ProductModel.fron(Map<String, dynamic> json) {
    return ProductModel(
      title: json['title'],
      price: (json['price'] as num).toDouble(),
      description: json['description'],
      category: json['category'],
      image: json['image'],
    );
  }
}

class CartModel {
  final int id;
  final String title;
  final double price;
  final String image;
  int quantity;

  CartModel({
    required this.id,
    required this.title,
    required this.price,
    required this.image,
    this.quantity = 0,
  });
}
