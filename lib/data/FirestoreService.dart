import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import '../Domain/Category.dart';
import '../Domain/Item.dart';

ValueNotifier<FirestoreService> firestoreService = ValueNotifier(FirestoreService());

class FirestoreService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  /// Get all items (e.g., for menu display)
  Future<List<Item>> getAllItems() async {
    final snapshot = await _firestore.collection('items').get();
    return snapshot.docs.map((doc) => Item.fromMap(doc.data())).toList();
  }

  /// Get the user's cart items using only item IDs (one-time fetch)
  Future<List<Item>> getCartItems(String userId) async {
    final cartSnapshot = await _firestore
        .collection('users')
        .doc(userId)
        .collection('cart')
        .get();

    final List<Item> cartItems = [];

    for (final cartDoc in cartSnapshot.docs) {
      final itemDoc = await _firestore
          .collection('items')
          .doc(cartDoc.id)
          .get();

      if (itemDoc.exists) {
        cartItems.add(Item.fromMap(itemDoc.data()!));
      }
    }

    return cartItems;
  }

  Stream<List<Item>> getCartItemsStream(String userId) {
    return _firestore
        .collection('users')
        .doc(userId)
        .collection('cart')
        .snapshots()
        .asyncMap((cartSnapshot) async {
      final itemIds = cartSnapshot.docs.map((doc) => doc.id).toList();
      print('Cart item IDs: $itemIds');

      if (itemIds.isEmpty) return [];

      if (itemIds.length > 10) {
        print('Warning: too many items for whereIn query: ${itemIds.length}');
        // Handle batching here if needed
        return []; // or handle batching logic below
      }

      final itemsQuery = await _firestore
          .collection('items')
          .where(FieldPath.documentId, whereIn: itemIds)
          .get();

      final items = itemsQuery.docs.map((doc) {
        print('Fetched item: ${doc.id} => ${doc.data()}');
        return Item.fromMap(doc.data());
      }).toList();

      return items;
    });
  }


  /// Add an item to the cart
  Future<void> addToCart(String userId, String itemId) async {
    await _firestore
        .collection('users')
        .doc(userId)
        .collection('cart')
        .doc(itemId)
        .set({});
  }

  /// Remove an item from the cart
  Future<void> removeFromCart(String userId, String itemId) async {
    await _firestore
        .collection('users')
        .doc(userId)
        .collection('cart')
        .doc(itemId)
        .delete();
  }

  Future<List<Category>> getAllCategories() async {
    final snapshot = await _firestore.collection('categories').get();
    print(snapshot.docs.map((doc) => Category.fromMap(doc.data())).toList().length);
    return snapshot.docs
        .map((doc) => Category.fromMap(doc.data()))
        .toList();
  }
}
