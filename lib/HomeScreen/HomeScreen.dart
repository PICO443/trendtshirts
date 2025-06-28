
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trendtshirts/HomeScreen/HomeScreenModel.dart';
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
      body: MultiProvider(providers: [
        ChangeNotifierProvider(create: (context) => HomeScreenModel())
      ],
        child: const HomeScreenBody(),
      ),
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
      child: Consumer<HomeScreenModel>(
      builder: (context, homeModel, child){
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          spacing: 16,
          children: [
            HomeSearchBar(onSearchKeywordChange: (searchKeyword) => homeModel.searchKeywordChanged(searchKeyword)),
            CategoriesSection(categoriesList: homeModel.categories, selectedCategory: homeModel.currentSelectedCategory, onSelected: (category) => homeModel.onCategorySelected(category),),
            Expanded(
              child: ListView.separated(
                shrinkWrap: true,
                  itemBuilder: (context, index) {
                return ItemCard(item: homeModel.items[index]);
              }, separatorBuilder: (context, index) {
                return SizedBox(height: 8);
              }, itemCount: homeModel.items.length),
            )
          ],
        );
      }
      )
      );
  }
}