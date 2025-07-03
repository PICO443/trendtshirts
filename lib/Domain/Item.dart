import 'Category.dart';

class Item {
  final String name;
  final String description;
  final double price;
  final String photoUrl;
  final Category category;

  Item(this.name, this.description, this.price, this.photoUrl,this.category);

  // Convert Item to Map
  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'description': description,
      'price': price,
      'photoUrl': photoUrl,
      'category': category.toMap(), // nested map for category
    };
  }

  // Create Item from Map
  factory Item.fromMap(Map<String, dynamic> map) {
    return Item(
      map['name'] ?? '',
      map['description'] ?? '',
      (map['price'] ?? 0).toDouble(),
      map['photoUrl'] ?? '',
      Category.fromMap(Map<String, dynamic>.from(map['category'] ?? {})),
    );
  }
}