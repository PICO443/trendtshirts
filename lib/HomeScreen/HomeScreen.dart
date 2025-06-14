
import 'package:flutter/material.dart';
import 'package:trendtshirts/HomeScreen/components/CategoriesSections.dart';
import 'package:trendtshirts/HomeScreen/components/HomeAppBar.dart';
import 'package:trendtshirts/HomeScreen/components/HomeSearchBar.dart';
import 'package:trendtshirts/HomeScreen/components/ItemCard.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF5F5F5),
      appBar: HomeAppBar(),
      body: HomeScreenBody(),
    );
  }
}

class HomeScreenBody extends StatelessWidget {
  const HomeScreenBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(8, 32, 8, 8),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          spacing: 16,
          children: [
            HomeSearchBar(),
            CategoriesSection(),
            Expanded(
              child: ListView.separated(
                shrinkWrap: true,
                  itemBuilder: (context, index) {
                return ItemCard();
              }, separatorBuilder: (context, index) {
                return SizedBox(height: 8);
              }, itemCount: 4),
            )
          ],
        )
      );
  }
}