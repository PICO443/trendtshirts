class Category {
  final String name;
  final int id;
  Category(this.name, this.id);

  // Convert Category to Map
  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'id': id,
    };
  }

  // Create Category from Map
  factory Category.fromMap(Map<String, dynamic> map) {
    return Category(
      map['name'] ?? '',
      map['id'] ?? 0,
    );
  }
}