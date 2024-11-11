import 'package:flutter/material.dart';

class ListHeader extends StatelessWidget {
  const ListHeader({super.key, required this.title, this.showViewMore = false});

  final String title;
  final bool showViewMore;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: 16,
        right: 16,
        bottom: 12,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: Theme.of(context)
                .textTheme
                .bodyLarge!
                .copyWith(fontWeight: FontWeight.bold),
          ),
          if (showViewMore)
            Flexible(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    'View All',
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium!
                        .copyWith(fontWeight: FontWeight.w600),
                  ),
                  SizedBox(
                    width: 4,
                  ),
                  Icon(
                    Icons.arrow_circle_right,
                    color: Theme.of(context).colorScheme.primary,
                  )
                ],
              ),
            ),
        ],
      ),
    );
  }
}
