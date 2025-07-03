
import 'package:flutter/material.dart';

import '../../../Domain/Item.dart';

class CheckOutCard extends StatelessWidget {
  final List<Item> items;

  const CheckOutCard({super.key, required this.items});

  double _calculateTotalPrice(List<Item> items){
    return items.fold(0, (value, item) => value + item.price);
  }

  @override
  Widget build(BuildContext context) {
    final double deliveryCost = 2000;
    return Card(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            CheckoutTotalPrice(totalPrice: _calculateTotalPrice(items) + deliveryCost,),
            SizedBox(height: 16),
            Column(
              spacing: 8,
              children: [
                CheckoutInfo(label: "Items Price", amount: _calculateTotalPrice(items)),
                CheckoutInfo(label: "Delivery Cost", amount: deliveryCost),
              ],
            ),
            SizedBox(height: 16),
            CheckoutActionButton()
          ],
        ),
      )
    );
  }

}



class CheckoutActionButton extends StatelessWidget {
  const CheckoutActionButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: FilledButton(
          style: ButtonStyle(backgroundColor: WidgetStateProperty.all(Color(0xFF2962FF))),
          onPressed: (){},
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Checkout"),
              Icon(Icons.arrow_forward_ios)
            ],
          ),
      ),
    );
  }
}

class CheckoutInfo extends StatelessWidget {
  final String label;
  final double amount;

  const CheckoutInfo({
    required this.label,
    super.key, required this.amount,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text("$label:",  style: theme.typography.englishLike.bodyLarge?.copyWith(color: Colors.black.withAlpha(100))),
        Text("\$$amount", style: theme.typography.englishLike.bodyLarge?.copyWith(color: Colors.black.withAlpha(100))),
      ],
    );
  }
}

class CheckoutTotalPrice extends StatelessWidget {
  final double totalPrice;

  const CheckoutTotalPrice({
    super.key, required this.totalPrice,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text("Total Price:", style: theme.typography.englishLike.titleLarge?.copyWith(color: Colors.black),),
        Text("\$$totalPrice",  style: theme.typography.englishLike.titleLarge?.copyWith(color: Colors.black)),
      ],
    );
  }
}