import 'dart:collection';

import 'package:flutter/cupertino.dart';

import '../../Domain/Category.dart';
import '../../Domain/Item.dart';

class HomeScreenModel extends ChangeNotifier {
  HomeScreenModel(){
    currentSelectedCategory = 0;
    _filteredItems = _items;
  }
  final List<Item> _items = [
    Item("hello", "description", 3423, "", Category("Category 1", 1)),
    Item("host", "description", 3423, "", Category("Category 1", 1)),
    Item("holy", "description", 3423, "", Category("Category 2", 2)),
    Item("holy", "description", 3423, "", Category("Category 2", 2)),
    Item("pok", "description", 3423, "", Category("Category 2", 2)),

  ];

  List<Item> _filteredItems = [];

  final List<Category> _categories = [Category("All", 0), Category("Category 1", 1), Category("Category 2", 2)];
  int currentSelectedCategory = 0;

  UnmodifiableListView<Category> get categories => UnmodifiableListView(_categories);

  UnmodifiableListView<Item> get items => UnmodifiableListView(_filteredItems);

  String searchKeyword = "";

  void searchKeywordChanged(String newSearchKeyword){
    searchKeyword = newSearchKeyword;
    _filteredItems = _filterItemsByCategory(currentSelectedCategory, _items);
    if(newSearchKeyword.isNotEmpty){
      _filteredItems = _filterItemsByKeyword(searchKeyword, _items);
    }
    notifyListeners();
  }

  void addItem(Item item){
    _items.add(item);
    notifyListeners();
  }

  void deleteItem(Item item){
    _items.remove(item);
    notifyListeners();
  }

  void onCategorySelected(int category){
    currentSelectedCategory = category;
    _filteredItems = _filterItemsByKeywordAndCategory(searchKeyword, category, _items);
    notifyListeners();
  }

  List<Item> _filterItemsByKeywordAndCategory(String keyword, int categoryId, List<Item> items){
    return _filterItemsByKeyword(keyword, _filterItemsByCategory(categoryId, items));
}

  List<Item> _filterItemsByKeyword(String keyword, List<Item> itemsList) {
    return itemsList
        .where((item) => item.name.toLowerCase().contains(keyword.toLowerCase()))
        .toList();
  }

  List<Item> _filterItemsByCategory(int categoryId, List<Item> itemsList) {
    if (categoryId == 0) return itemsList;
    return itemsList.where((item) => item.category.id == categoryId).toList();
  }

}