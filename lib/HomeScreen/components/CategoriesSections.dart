import 'package:flutter/material.dart';

class CategoriesSection extends StatelessWidget {
  const CategoriesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return  SizedBox(
      height: 40,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
          itemCount: 8,
            itemBuilder: (context, index){
          return FilterChip(label: Text("Category"), onSelected: (_){});
        }, separatorBuilder: (BuildContext context, int index) { return SizedBox(width: 8); },
      ),
    );

    // return Row(
    //     spacing: 4,
    //     children: [
    //       FilterChip(label: Text("Category"), onSelected: (_){}),
    //       FilterChip(label: Text("Category"), onSelected: (_){}),
    //       FilterChip(label: Text("Category"), onSelected: (_){}),
    //       FilterChip(label: Text("Category"), onSelected: (_){}),
    //       FilterChip(label: Text("Category"), onSelected: (_){}),
    //       FilterChip(label: Text("Category"), onSelected: (_){}),
    //     ],
    // );
  }

}