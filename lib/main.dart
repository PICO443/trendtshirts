import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trendtshirts/presentation/CartScreen/CartScreenModel.dart';
import 'package:trendtshirts/presentation/HomeScreen/HomeScreen.dart';
import 'package:trendtshirts/presentation/HomeScreen/HomeScreenModel.dart';

void main() {
  runApp(const TrendTShirtsApp());
}

class TrendTShirtsApp extends StatelessWidget {
  const TrendTShirtsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: [
      ChangeNotifierProvider(create: (context) => HomeScreenModel()),
      ChangeNotifierProvider(create: (context) => CartScreenModel()),
    ], child:  MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Color(0xFF2962FF)),
      ),
      home: const HomeScreen(),
    )
    );
  }
}
