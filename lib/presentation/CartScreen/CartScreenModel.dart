import 'dart:collection';

import 'package:flutter/cupertino.dart';
import 'package:trendtshirts/Domain/Category.dart';

import '../../Domain/Item.dart';


class CartScreenModel extends ChangeNotifier{
  final List<Item> _cartItems = [
    Item("name", "description", 4545, "", Category("dsd", 1))
  ];

  UnmodifiableListView<Item> get cartItems => UnmodifiableListView(_cartItems);

  void addToCart(Item item){
    _cartItems.add(item);
    notifyListeners();
  }

  void removeFromCart(Item item){
    _cartItems.remove(item);
    notifyListeners();
  }
}