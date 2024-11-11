import 'package:flutter/material.dart';
import 'package:pharmaceutical_app/screens/products_screen.dart';

import '../widgets/carousel_slider.dart';
import '../widgets/home_grid.dart';
import '../widgets/homescreen_app_bar.dart';
import '../widgets/horizontal_list_item.dart';
import '../widgets/list_header.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final List<String> urls = [
    'https://cdn.grabon.in/gograbon/images/web-images/uploads/1618566639430/protein-supplements-coupons.jpg',
    'https://vitaminberry.com/cdn/shop/articles/Copy_of_Untitled_-_Edited.jpg?v=1671195230&width=533',
    'https://naturaltein.in/wp-content/uploads/2022/06/Here-is-the-Best-Protein-Supplement-in-India-Without-Side-Effects.jpeg'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            HomeScreenCarouselSlider(
              urls: urls,
            ),
            SizedBox(
              height: 24,
            ),
            HorizontalList(),
            Divider(),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (ctx) => ProductsScreen()),
                );
              },
              child: HomeGridView(),
            ),
            SizedBox(
              height: 24,
            ),
          ],
        ),
      ),
    );
  }
}

class HorizontalList extends StatelessWidget {
  const HorizontalList({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        ListHeader(title: 'Mega Saving Zone'),
        Container(
          height: 300,
          child: ListView.separated(
              scrollDirection: Axis.horizontal,
              padding: EdgeInsets.symmetric(horizontal: 16),
              itemBuilder: (ctx, index) {
                for (int i = 0; i < 8; i++) return HorizontalItem();
              },
              separatorBuilder: (ctx, index) => SizedBox(
                    width: 12,
                  ),
              itemCount: 8),
        ),
      ],
    );
  }
}
