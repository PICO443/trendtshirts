import 'package:flutter/material.dart';
import 'package:trendtshirts/presentation/HomeScreen/components/ItemCard.dart';
import 'package:trendtshirts/presentation/ItemDetailsScreen/components/ItemDetailsScreenAppBar.dart';

import '../../Domain/Item.dart';

class ItemDetailsScreen extends StatelessWidget {
  final Item item;
  final Function(Item) onAddToCartClick;
  const ItemDetailsScreen({super.key, required this.item, required this.onAddToCartClick});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ItemDetailsScreenAppBar(item: item),
      body: ItemDetailsScreenBody(onAddToCartClick: (item){ onAddToCartClick(item);}, item: item),
    );
  }

}

class ItemDetailsScreenBody extends StatelessWidget {
  final Item item;
  final Function(Item) onAddToCartClick;

  const ItemDetailsScreenBody({super.key, required this.onAddToCartClick, required this.item});


  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      children: [
        Row(
          children: [
            SizedBox(
                height: 150,
                width: 150,
                child: Image.asset("assets/images/placeholder.png")
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(item.name, style: theme.typography.englishLike.titleLarge?.copyWith(color: Colors.black)),
                Text(item.category.name, style: TextStyle(color: Colors.grey)),
                Text(
                    item.description,
                    maxLines: 4,
                    overflow: TextOverflow.ellipsis,
                    softWrap: true,
                ),
                Row(
                  children: [
                    CardActions(theme: theme, onAddToCartClick: onAddToCartClick, item: item)
                  ],
                )
              ],
            )
          ],
        )
      ],
    );
  }

}
