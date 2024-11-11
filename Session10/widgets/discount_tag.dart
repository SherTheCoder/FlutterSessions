import 'package:flutter/material.dart';

class DiscountTag extends StatelessWidget {
  const DiscountTag({super.key, required this.title, required this.kBorderRadius});

  final String title;
  final double kBorderRadius;
  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: DiscountClipPath(),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 24, vertical: 8),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.secondaryContainer,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(kBorderRadius),
          ),
        ),
        child: Text(
          title,
          style: Theme.of(context).textTheme.bodySmall,
        ),
      ),
    );
  }
}

class DiscountClipPath extends CustomClipper<Path>{
  @override
  Path getClip(Size size) {
    double w = size.width;
    double h = size.height;
    final path = Path();
    path.lineTo(0, h);
    path.lineTo(w*0.8, h);
    path.lineTo(w,0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }



}