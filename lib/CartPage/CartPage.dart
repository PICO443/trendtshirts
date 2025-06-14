import 'package:flutter/material.dart';
import 'package:trendtshirts/CartPage/components/CartItem.dart';
import 'package:trendtshirts/CartPage/components/CartPageAppBar.dart';
import 'package:trendtshirts/CartPage/components/CheckoutCard.dart';

class CartPage extends StatelessWidget{
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CartPageAppBar(),
      body: Column(
        children: [
          CheckOutCard(),
          CartItem()
        ],
      ),
    );
  }

}