import 'package:flutter/material.dart';

class HomeSearchBar extends StatelessWidget{
  final Function(String) onSearchKeywordChange;
  const HomeSearchBar({ super.key, required this.onSearchKeywordChange});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      spacing: 16,
      children: [
        Expanded(
          child: SearchBar(
            backgroundColor: WidgetStateProperty.all(Colors.white),
            elevation: WidgetStateProperty.all(0),
            leading: Icon(Icons.search),
            hintText: "Search for an item",
            onChanged: (text){
              onSearchKeywordChange(text);
            },
          ),
        ),
        SizedBox(
          height: 46,
          child: FilledButton(
            style: ButtonStyle(backgroundColor: WidgetStateProperty.all(Color(0xFF2962FF))),
              onPressed: (){},
              child: Text("Search")
          ),
        )
      ],
    );
  }

}