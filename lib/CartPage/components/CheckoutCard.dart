
import 'package:flutter/material.dart';

class CheckOutCard extends StatelessWidget {
  const CheckOutCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            CheckoutTotalPrice(),
            SizedBox(height: 16),
            Column(
              spacing: 8,
              children: [
                CheckoutInfo(label: "Items Price"),
                CheckoutInfo(label: "Delivery Cost"),
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

  const CheckoutInfo({
    required this.label,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text("$label:",  style: theme.typography.englishLike.bodyLarge?.copyWith(color: Colors.black.withAlpha(100))),
        Text("\$2,000", style: theme.typography.englishLike.bodyLarge?.copyWith(color: Colors.black.withAlpha(100))),
      ],
    );
  }
}

class CheckoutTotalPrice extends StatelessWidget {
  const CheckoutTotalPrice({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text("Total Price:", style: theme.typography.englishLike.titleLarge?.copyWith(color: Colors.black),),
        Text("\$2,000",  style: theme.typography.englishLike.titleLarge?.copyWith(color: Colors.black)),
      ],
    );
  }
}