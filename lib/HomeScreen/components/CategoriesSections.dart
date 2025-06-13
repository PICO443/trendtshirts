import 'package:flutter/material.dart';

class CategoriesSection extends StatelessWidget {
  const CategoriesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 4,
      children: [
        Chip(label: Text("Category 1")),
        Chip(label: Text("Category 1")),
        Chip(label: Text("Category 1")),
        Chip(label: Text("Category 1")),
        Chip(label: Text("Category 1")),
        Chip(label: Text("Category 1")),
      ],
    );

  }

}