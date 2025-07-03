import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:trendtshirts/presentation/CartScreen/CartScreenModel.dart';

import 'components/CartItem.dart';
import 'components/CartPageAppBar.dart';
import 'components/CheckoutCard.dart';

class CartScreen extends StatelessWidget{
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CartPageAppBar(),
      body: Consumer<CartScreenModel>(builder: (context, model, child){
            return Column(
              children: [
                CheckOutCard(items: model.cartItems),
                Expanded(
                    child: Consumer<CartScreenModel>(builder: (context, model, child){
                      return ListView.builder(itemBuilder: (context, index) {
                        return CartItem(item: model.cartItems[index], onRemoveClick: (item) => model.removeFromCart(item),);
                      },
                        itemCount: model.cartItems.length,
                      );
                    })
                ),
              ],
            );
          })
    );
  }

}