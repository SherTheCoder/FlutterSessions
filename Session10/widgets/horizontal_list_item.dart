import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import 'discount_tag.dart';

class HorizontalItem extends StatelessWidget {
  const HorizontalItem({super.key});

  final double kBorderRadius = 12;
  final double kPadding = 12;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 3 / 4,
      child: Container(
        clipBehavior: Clip.hardEdge,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(kBorderRadius),
          color: Colors.white,
          border: Border.all(
              width: 0.5, color: Theme.of(context).colorScheme.primary),
        ),
        child: Stack(
          clipBehavior: Clip.hardEdge,
          children: [
            Padding(
              padding: EdgeInsets.all(kPadding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(
                    child: Image.asset(
                      'assets/images/supplementImage.jpeg',
                      fit: BoxFit.contain,
                    ),
                  ),
                  SizedBox(
                    height: 2,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.end,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      ItemRatingsIndicator(),
                      ItemTitle(),
                      SizedBox(
                        height: 4,
                      ),
                      ItemPriceText(),
                      SizedBox(
                        height: 4,
                      ),
                      AddToCartButton(kBorderRadius: kBorderRadius),
                    ],
                  ),
                ],
              ),
            ),
            Positioned(
              top: 0,
              left: 0,
              child: DiscountTag(
                title: '47% off',
                kBorderRadius: kBorderRadius,
              ),
            ),
            Positioned(
              top: kPadding,
              right: kPadding,
              child: LikeButton(),
            ),
          ],
        ),
      ),
    );
  }
}

class ItemRatingsIndicator extends StatelessWidget {
  const ItemRatingsIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        RatingBarIndicator(
          itemBuilder: (context, index) => Icon(
            Icons.star,
            color: Theme.of(context).colorScheme.tertiary,
          ),
          rating: 3.75,
          itemCount: 5,
          itemSize: 15.0,
        ),
        SizedBox(
          width: 8,
        ),
        Text(
          '3.75',
          style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                fontWeight: FontWeight.bold,
                color: Theme.of(context).colorScheme.secondary,
              ),
        ),
      ],
    );
  }
}

class ItemTitle extends StatelessWidget {
  const ItemTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      "ON Whey Protein Gold Standard",
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
      style: Theme.of(context)
          .textTheme
          .bodyLarge!
          .copyWith(height: 0, letterSpacing: 1.1),
    );
  }
}

class ItemPriceText extends StatelessWidget {
  const ItemPriceText({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
          style: Theme.of(context).textTheme.titleMedium!.copyWith(
                fontWeight: FontWeight.bold,
              ),
          children: [
            TextSpan(text: '₹3200'),
            WidgetSpan(
              child: SizedBox(
                width: 10,
              ),
            ),
            TextSpan(
                text: '₹4200',
                style: TextStyle(
                    decoration: TextDecoration.lineThrough,
                    color: Colors.grey)),
          ]),
    );
  }
}

class AddToCartButton extends StatelessWidget {
  const AddToCartButton({super.key, required this.kBorderRadius});

  final double kBorderRadius;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(kBorderRadius),
          color: Theme.of(context).colorScheme.primary,
        ),
        child: Center(
          child: Text(
            'Add to Cart',
            style: Theme.of(context).textTheme.titleMedium!.copyWith(
                fontWeight: FontWeight.bold,
                color: Theme.of(context).colorScheme.onPrimary),
          ),
        ),
      ),
    );
  }
}

class LikeButton extends StatelessWidget {
  const LikeButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Icon(
      Icons.thumb_up_alt_outlined,
      color: Theme.of(context).colorScheme.primary,
    );
  }
}
