import 'package:flutter/material.dart';

class CategoriesSection extends StatelessWidget {
  const CategoriesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 4,
      runSpacing: 8,
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