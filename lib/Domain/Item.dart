import 'Category.dart';

class Item {
  final String name;
  final String description;
  final double price;
  final String photoUrl;
  final Category category;

  Item(this.name, this.description, this.price, this.photoUrl,this.category);

}