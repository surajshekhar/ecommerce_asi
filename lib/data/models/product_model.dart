class Product {
  final int id;
  final String title;
  final String imageUrl;
  final double price;
  final double discountPercentage;

  Product({
    required this.id,
    required this.title,
    required this.imageUrl,
    required this.price,
    required this.discountPercentage,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      title: json['title'],
      imageUrl: json['thumbnail'],
      price: json['price'].toDouble(),
      discountPercentage: json['discountPercentage'].toDouble(),
    );
  }

  double get discountedPrice => price - (price * discountPercentage / 100);
}
