
class Product {
  final String id;
  final String title;
  final String details;
  final String category;
  final int price;
  final int? countItemOrder;
  final List<String> image;

  Product({
    required this.id,
    required this.image,
    required this.title,
    required this.price,
    required this.category,
    required this.countItemOrder,
    required this.details,
  });

  factory Product.fromFirestore(Map<String, dynamic> data, String id) {
    return Product(
      id: id,
      image: List<String>.from(data['image']),
      title: data['title'] ?? '',
      price: data['price'] ?? 8,
      countItemOrder: data['countItemOrder'] ?? 9,
      details: data['details'],
      category: data['category'] ?? '',
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      "category": category,
      'image': image,
      'title': title,
      'price': price,
      'countItemOrder': countItemOrder,
      'details': details,
    };
  }
}
