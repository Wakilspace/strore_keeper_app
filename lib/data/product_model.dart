// lib/data/product_model.dart

class Product {
  final int? id;
  final String name;
  final int quantity;
  final double price;
  final String? imagePath;

  Product({
    this.id,
    required this.name,
    required this.quantity,
    required this.price,
    this.imagePath,
  });

  // Convert Product to Map (for SQLite)
  Map<String, dynamic> toMap() {
    final map = <String, dynamic>{
      'name': name,
      'quantity': quantity,
      'price': price,
      'imagePath': imagePath,
    };

    if (id != null) {
      map['id'] = id;
    }

    return map;
  }

  // Convert Map (from SQLite) to Product object
  factory Product.fromMap(Map<String, dynamic> map) {
    return Product(
      id: map['id'] as int?,
      name: map['name'] as String,
      quantity: map['quantity'] as int,
      price: map['price'] is int
          ? (map['price'] as int).toDouble()
          : map['price'] as double,
      imagePath: map['imagePath'] as String?,
    );
  }
}
