import 'dart:async';
import 'dart:collection';

import 'package:flutter/cupertino.dart';
import 'package:trendtshirts/data/AuthService.dart';
import 'package:trendtshirts/data/FirestoreService.dart';

import '../../Domain/Item.dart';

class CartScreenModel extends ChangeNotifier {
  final List<Item> _cartItems = [];
  StreamSubscription<List<Item>>? _cartSubscription;

  UnmodifiableListView<Item> get cartItems => UnmodifiableListView(_cartItems);

  CartScreenModel() {
    _listenToCartItems();
  }

  void _listenToCartItems() {
    final userId = authService.value.currentUser?.uid;
    if (userId == null) return;

    _cartSubscription?.cancel();

    _cartSubscription = firestoreService.value
        .getCartItemsStream(userId)
        .listen((items) {
      _cartItems
        ..clear()
        ..addAll(items);
      notifyListeners();
    });
  }

  Future<void> addToCart(Item item) async {
    final userId = authService.value.currentUser?.uid;
    if (userId == null) return;

    await firestoreService.value.addToCart(userId, item.name);
    // Stream listener will update _cartItems automatically
  }

  Future<void> removeFromCart(Item item) async {
    final userId = authService.value.currentUser?.uid;
    if (userId == null) return;

    await firestoreService.value.removeFromCart(userId, item.name);
    // Stream listener will update _cartItems automatically
  }

  @override
  void dispose() {
    _cartSubscription?.cancel();
    super.dispose();
  }
}
