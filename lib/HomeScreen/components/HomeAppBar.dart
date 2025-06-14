import 'package:flutter/material.dart';
import 'package:trendtshirts/CartPage/CartPage.dart';

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);

    return AppBar(

      title: AppBarTitle(),
      actions: [
        IconButton(onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context) => CartPage()));
        }, icon: Icon(Icons.shopping_cart), color: theme.colorScheme.onPrimary,)
      ],
      backgroundColor: Color(0xFF2962FF),
      centerTitle: true,
      elevation: 1,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class AppBarTitle extends StatelessWidget {
  const AppBarTitle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);

    return Row(
      spacing: 16,
      children: [
        Image.asset(
          "assets/images/logo.png",
          height: 40,
        ),
         Text.rich(
          TextSpan(
            style: TextStyle(fontFamily: "lobster"),
            children: [
              TextSpan(text: 'T', style: TextStyle(color: Colors.red)),
              TextSpan(text: 'rend', style: TextStyle(color: theme.colorScheme.onPrimary)),
              TextSpan(text: 'T', style: TextStyle(color: Colors.red)),
              TextSpan(text: '-Shirts', style: TextStyle(color: theme.colorScheme.onPrimary)),
            ],
          ),
        )

      ],
    );
  }
}
