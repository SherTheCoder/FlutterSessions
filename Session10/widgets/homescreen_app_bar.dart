import 'package:flutter/material.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MyAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: Padding(
        padding: EdgeInsets.all(4),
        child: Icon(Icons.menu),
      ),
      title: Container(
        padding: EdgeInsets.all(4),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.secondaryContainer,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          children: [
            Icon(
              Icons.search,
              color: Theme.of(context).colorScheme.onSecondaryContainer,
            ),
            SizedBox(
              width: 12,
            ),
            Text(
              'Search for products',
              style: Theme.of(context).textTheme.bodySmall!.copyWith(
                  color: Theme.of(context).colorScheme.onSecondaryContainer),
            )
          ],
        ),
      ),
      automaticallyImplyLeading: false,
      actions: [
        Padding(
          padding: EdgeInsets.only(right: 4),
          child: CartIcon(),
        )
      ],
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(50);
}

class CartIcon extends StatelessWidget {
  const CartIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Icon(
            Icons.shopping_cart,
            size: 25,
          ),
        ),
        Positioned(
          top: 0,
          right: 0,
          child: CircleAvatar(
            backgroundColor: Colors.red,
            maxRadius: 8,
            minRadius: 4,
            child: Text(
              '3',
              style: Theme.of(context)
                  .textTheme
                  .bodySmall!
                  .copyWith(color: Colors.white),
            ),
          ),
        )
      ],
    );
  }
}
