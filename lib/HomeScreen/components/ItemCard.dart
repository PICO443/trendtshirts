import 'package:flutter/material.dart';

import '../HomeScreenModel.dart';

class ItemCard extends StatelessWidget {
  final Item item;
  const ItemCard({required this.item,super.key});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Card(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          spacing: 16,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CardMedia(photoUrl: (item.photoUrl.isEmpty)? "assets/images/placeholder.png": item.photoUrl),
            CardContent(theme: theme, item: item,),
          ],
        ),
      ),
    );
  }
}

class CardContent extends StatelessWidget {
  final Item item;

  const CardContent({
    required this.item,
    super.key,
    required this.theme,
  });

  final ThemeData theme;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        spacing: 4,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(item.name, style: theme.typography.englishLike.titleLarge?.copyWith(color: Colors.black)),
          Text(item.category.name, style: TextStyle(color: Colors.grey)),
          SizedBox(height: 4),
          Text(
            item.description,
            maxLines: 4,
            overflow: TextOverflow.ellipsis,
            softWrap: true,
          ),
          CardActions(itemPrice: item.price,theme: theme)
        ],
      ),
    );
  }
}

class CardActions extends StatelessWidget {
  final double itemPrice;

  const CardActions({
    required this.itemPrice,
    super.key,
    required this.theme,
  });

  final ThemeData theme;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      spacing: 16,
      children: [
        Text("$itemPrice", style: theme.typography.englishLike.titleMedium?.copyWith(color: Colors.black)),
        FilledButton.tonal(
          style: ButtonStyle(
              backgroundColor: WidgetStateProperty.all(Color(0xFFF1C0E8)),
            minimumSize: WidgetStateProperty.all(Size(200, 50))
          ),
            onPressed: (){
            },
            child: Row(
              spacing: 8,
              children: [
                Icon(Icons.add_shopping_cart),
                Text("Add to cart")
              ],
            )
        )
      ],
    );
  }
}

class CardMedia extends StatelessWidget {
  final String photoUrl;
  const CardMedia({
    required this.photoUrl,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
      width: 150,
      child: Image.asset(photoUrl, fit: BoxFit.cover),
    );
  }
}
