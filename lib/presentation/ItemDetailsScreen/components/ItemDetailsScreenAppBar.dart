import 'package:flutter/material.dart';

import '../../../Domain/Item.dart';

class ItemDetailsScreenAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Item item;
  const ItemDetailsScreenAppBar({super.key, required this.item});

  @override
  Widget build(BuildContext context) {

    return AppBar(
      leading: BackButton(
        onPressed: () {
          Navigator.pop(context);
        },
      ),
      title: Text(item.name),
      backgroundColor: const Color(0xFF2962FF),
      foregroundColor: Colors.white,
      centerTitle: true,
      elevation: 1,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}