import 'package:flutter/material.dart';
import 'package:pharmaceutical_app/widgets/homescreen_app_bar.dart';

class ProductsAppbar extends StatelessWidget implements PreferredSizeWidget {
  const ProductsAppbar({super.key, this.title, required this.isCart});

  final String? title;
  final bool isCart;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: false,
      titleSpacing: 0,
      leading: Padding(
        padding: EdgeInsets.all(4),
        child: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(Icons.arrow_back_ios),
        ),
      ),
      title: isCart
          ? Text(
              'Cart',
              style: Theme.of(context).textTheme.titleMedium,
            )
          : title != null
              ? Text(
                  title!,
                  style: Theme.of(context).textTheme.titleMedium,
                )
              : null,
      actions: isCart
          ? [
              Icon(Icons.search),
              Padding(
                padding: EdgeInsets.only(right: 4),
                child: CartIcon(),
              ),
            ]
          : null,
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(45);
}
