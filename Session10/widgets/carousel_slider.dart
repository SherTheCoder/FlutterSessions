import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';

class HomeScreenCarouselSlider extends StatefulWidget {
  const HomeScreenCarouselSlider({super.key, required this.urls});

  final List<String> urls;

  @override
  State<HomeScreenCarouselSlider> createState() =>
      _HomeScreenCarouselSliderState();
}

class _HomeScreenCarouselSliderState extends State<HomeScreenCarouselSlider> {
  int dotsIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).colorScheme.primary,
      child: Stack(
        children: [
          CarouselSlider.builder(
            itemCount: widget.urls.length,
            itemBuilder: (context, index, realIndex) {
              return CarouselItem(
                imageUrlList: widget.urls,
                index: index,
              );
            },
            options: CarouselOptions(
                onPageChanged: (index, reason) {
                  setState(() {
                    dotsIndex = index;
                  });
                },
                clipBehavior: Clip.hardEdge,
                viewportFraction: 1,
                aspectRatio: 3 / 2,
                autoPlay: true,
                autoPlayCurve: Curves.easeInOut,
                autoPlayAnimationDuration: Duration(seconds: 1),
                autoPlayInterval: Duration(milliseconds: 3500),
                pauseAutoPlayOnManualNavigate: true,
                enlargeCenterPage: true,
                enlargeFactor: 0.3),
          ),
          Positioned.fill(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: EdgeInsets.all(4),
                child: DotsIndicator(
                  dotsCount: widget.urls.length,
                  position: dotsIndex,
                  decorator: DotsDecorator(
                    spacing: EdgeInsets.all(4),
                    size: Size(6, 6),
                    activeSize: Size(8, 8),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CarouselItem extends StatelessWidget {
  const CarouselItem(
      {super.key, required this.imageUrlList, required this.index});

  final List<String> imageUrlList;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Image.network(
        imageUrlList[index],
        fit: BoxFit.fill,
      ),
    );
  }
}
