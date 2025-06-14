import 'package:flutter/material.dart';

class CartItem extends StatelessWidget {
  const CartItem({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Card(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ItemInfo(theme: theme),
            ItemActions(theme: theme)
          ],
        ),
      ),
    );
  }

}

class ItemActions extends StatelessWidget {
  const ItemActions({
    super.key,
    required this.theme,
  });

  final ThemeData theme;

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 8,
      children: [
        Text("\$2.00", style: theme.typography.englishLike.bodyLarge?.copyWith(color: Colors.black)),
        IconButton(onPressed: (){}, icon: Icon(Icons.delete, color: Colors.red,))
      ],
    );
  }
}

class ItemInfo extends StatelessWidget {
  const ItemInfo({
    super.key,
    required this.theme,
  });

  final ThemeData theme;

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 8,
      children: [
        SizedBox(width: 48,child: Image.asset("assets/images/placeholder.png")),
        Text("Custom Designed", style: theme.typography.englishLike.bodyLarge?.copyWith(color: Colors.black),),
      ],
    );
  }
}