import 'package:flutter/material.dart';
import 'package:trendtshirts/Domain/Item.dart';

class CartItem extends StatelessWidget {
  final Item item;
  final Function(Item) onRemoveClick;
  const CartItem({super.key, required this.item, required this.onRemoveClick});

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
            ItemInfo(theme: theme, item: item),
            ItemActions(theme: theme, onRemoveClick: onRemoveClick, item: item,)
          ],
        ),
      ),
    );
  }

}

class ItemActions extends StatelessWidget {
  final Item item;
  final Function(Item) onRemoveClick;
  const ItemActions({
    super.key,
    required this.theme, required this.item, required this.onRemoveClick,
  });

  final ThemeData theme;

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 8,
      children: [
        Text("\$${item.price}", style: theme.typography.englishLike.bodyLarge?.copyWith(color: Colors.black)),
        IconButton(onPressed: (){ onRemoveClick(item);}, icon: Icon(Icons.delete, color: Colors.red,))
      ],
    );
  }
}

class ItemInfo extends StatelessWidget {
  final Item item;
  const ItemInfo({
    super.key,
    required this.theme, required this.item,
  });

  final ThemeData theme;

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 8,
      children: [
        SizedBox(width: 48,child: Image.asset((item.photoUrl.isEmpty)? "assets/images/placeholder.png" : item.photoUrl)),
        Text(item.name, style: theme.typography.englishLike.bodyLarge?.copyWith(color: Colors.black),),
      ],
    );
  }
}