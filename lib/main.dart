import 'package:flutter/material.dart';
import 'package:trendtshirts/CartPage/CartPage.dart';
import 'package:trendtshirts/HomeScreen/HomeScreen.dart';

void main() {
  runApp(const TrendTShirtsApp());
}

class TrendTShirtsApp extends StatelessWidget {
  const TrendTShirtsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Color(0xFF2962FF)),
      ),
      home: const CartPage(),
    );
  }
}
