import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class VerticalItem extends StatelessWidget {
  const VerticalItem({super.key});

  final double kBorderRadius = 12;
  final double kWidthTogglePoint = 338;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return AspectRatio(
          aspectRatio: 2.785,
          child: Container(
            width: double.infinity,
            clipBehavior: Clip.hardEdge,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(kBorderRadius),
                border: Border.all(
                  width: 0.5,
                  color: Theme
                      .of(context)
                      .colorScheme
                      .primary,
                )),
            child: Stack(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Expanded(
                      flex: 10,
                      child: Container(
                        decoration: BoxDecoration(
                          color: Theme
                              .of(context)
                              .colorScheme
                              .primaryContainer,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(kBorderRadius),
                            bottomLeft: Radius.circular(kBorderRadius),
                          ),
                        ),
                        padding: EdgeInsets.all(8),
                        child: Image.asset(
                          'assets/images/supplementImage.jpeg',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 17,
                      child: Container(
                        padding: EdgeInsets.all(12),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'ON Whey Protein Gold Standard',
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: Theme
                                  .of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .copyWith(height: 0, letterSpacing: 1.1),
                            ),
                            if(constraints.maxWidth > kWidthTogglePoint)
                            Text(
                              '2.75 lbs, unflavoured',
                              overflow: TextOverflow.ellipsis,
                              style:
                              Theme
                                  .of(context)
                                  .textTheme
                                  .labelSmall!
                                  .copyWith(
                                color: Colors.grey,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            Row(
                              children: [
                                RatingBarIndicator(
                                  itemBuilder: (context, index) =>
                                      Icon(
                                        Icons.star,
                                        color: Theme
                                            .of(context)
                                            .colorScheme
                                            .tertiary,
                                      ),
                                  rating: 2.75,
                                  itemCount: 5,
                                  itemSize: 10,
                                ),
                                SizedBox(
                                  width: 8,
                                ),
                                Text(
                                  '2.75',
                                  style: Theme
                                      .of(context)
                                      .textTheme
                                      .bodySmall!
                                      .copyWith(
                                      color: Theme
                                          .of(context)
                                          .colorScheme
                                          .secondary),
                                ),
                                SizedBox(
                                  width: 4,
                                ),
                                Text(
                                  '(240 ratings)',
                                  style: Theme
                                      .of(context)
                                      .textTheme
                                      .bodySmall!
                                      .copyWith(
                                      color: Theme
                                          .of(context)
                                          .colorScheme
                                          .secondary),
                                )
                              ],
                            ),
                            Spacer(),
                            RichText(
                              text: TextSpan(
                                  style: Theme
                                      .of(context)
                                      .textTheme
                                      .titleMedium!
                                      .copyWith(fontWeight: FontWeight.w400),
                                  children: [
                                    TextSpan(text: "₹3200"),
                                    WidgetSpan(
                                        child: SizedBox(
                                          width: 4,
                                        )),
                                    TextSpan(
                                        text: "₹4500",
                                        style: Theme
                                            .of(context)
                                            .textTheme
                                            .titleSmall!
                                            .copyWith(
                                            decoration:
                                            TextDecoration.lineThrough,
                                            fontWeight: FontWeight.w300,
                                            color: Colors.grey)),
                                  ]),
                            ),
                          ],
                        ),
                      ),
                    ),
                    if(constraints.maxWidth > kWidthTogglePoint)
                    Expanded(
                      flex: 3,
                      child: Container(
                        padding: EdgeInsets.only(right: 12, top: 12, left: 2),
                        alignment: Alignment.topCenter,
                        child: FittedBox(
                          fit: BoxFit.cover,
                          child: Icon(
                            Icons.thumb_up_alt_outlined,
                            color: Theme
                                .of(context)
                                .colorScheme
                                .primary,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                if(constraints.maxWidth > kWidthTogglePoint)
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: BestSellerTag(
                      kBorderRadius: kBorderRadius, title: 'BestSeller!'),
                ),
              ],
            ),
          ),
        );
      },

    );
  }
}

class BestSellerTag extends StatelessWidget {
  const BestSellerTag(
      {super.key, required this.kBorderRadius, required this.title});

  final double kBorderRadius;
  final String title;

  @override
  Widget build(BuildContext context) {
    return RotatedBox(
      quarterTurns: 3,
      child: ClipPath(
        clipper: BestSellerTagClipPath(),
        child: Container(
          padding: EdgeInsets.fromLTRB(8, 8, 20, 8),
          decoration: BoxDecoration(
            color: Theme
                .of(context)
                .colorScheme
                .tertiaryContainer,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(kBorderRadius),
            ),
          ),
          child: Text(
            title,
            style: Theme
                .of(context)
                .textTheme
                .bodySmall!
                .copyWith(
              color: Theme
                  .of(context)
                  .colorScheme
                  .onTertiaryContainer,
            ),
          ),
        ),
      ),
    );
  }
}


class BestSellerTagClipPath extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    double w = size.width;
    double h = size.height;

    final path = Path();

    path.lineTo(0, h);
    path.lineTo(w, h);
    path.lineTo(w * 0.8, 0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }

}
