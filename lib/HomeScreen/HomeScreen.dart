
import 'package:flutter/material.dart';
import 'package:trendtshirts/HomeScreen/components/HomeAppBar.dart';
import 'package:trendtshirts/HomeScreen/components/HomeSearchBar.dart';

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
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          HomeSearchBar()
        ],
      ),
    );
  }
}