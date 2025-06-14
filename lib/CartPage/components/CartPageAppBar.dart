import 'package:flutter/material.dart';

class CartPageAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CartPageAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return AppBar(
      title: Text("Cart", style: TextStyle(color: theme.colorScheme.onPrimary),),
      centerTitle: true,
      backgroundColor: Color(0xFF2962FF),
      elevation: 1,
      leading: IconButton(onPressed: (){
        Navigator.pop(context);
      }, icon: Icon(Icons.arrow_back_ios), color: Theme.of(context).colorScheme.onPrimary,),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}