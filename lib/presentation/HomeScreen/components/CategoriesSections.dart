import 'package:flutter/material.dart';

import '../../../Domain/Category.dart';


class CategoriesSection extends StatelessWidget {
  final List<Category> categoriesList;
  final int selectedCategory;
  final Function(int) onSelected;
  const CategoriesSection({required this.categoriesList,super.key, required this.selectedCategory, required this.onSelected});

  @override
  Widget build(BuildContext context) {
    return  SizedBox(
      height: 40,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
          itemCount: categoriesList.length,
            itemBuilder: (context, index){
          return FilterChip(label: Text(categoriesList[index].name), onSelected: (selected) => {onSelected(categoriesList[index].id)}, selected: categoriesList[index].id == selectedCategory,);
        }, separatorBuilder: (BuildContext context, int index) { return SizedBox(width: 8); },
      ),
    );
  }

}