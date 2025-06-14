import 'package:flutter/material.dart';

class ItemCard extends StatelessWidget {
  const ItemCard({super.key});

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
            CardMedia(),
            CardContent(theme: theme),
          ],
        ),
      ),
    );
  }
}

class CardContent extends StatelessWidget {
  const CardContent({
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
          Text("Custom Designed", style: theme.typography.englishLike.titleLarge?.copyWith(color: Colors.black)),
          Text("Item Category", style: TextStyle(color: Colors.grey)),
          SizedBox(height: 4),
          Text(
            "Lorem ipsum dolor sit amet consectetur. Viverra porta aliquet dolor luctus adipiscing mauris aliquam molestie.",
            maxLines: 4,
            overflow: TextOverflow.ellipsis,
            softWrap: true,
          ),
          CardActions(theme: theme)
        ],
      ),
    );
  }
}

class CardActions extends StatelessWidget {
  const CardActions({
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
        Text("2.00", style: theme.typography.englishLike.titleMedium?.copyWith(color: Colors.black)),
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
  const CardMedia({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
      width: 150,
      child: Image.asset("assets/images/placeholder.png", fit: BoxFit.cover),
    );
  }
}
