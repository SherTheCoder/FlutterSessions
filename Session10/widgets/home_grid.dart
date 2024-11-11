import 'package:flutter/material.dart';
import 'package:pharmaceutical_app/widgets/list_header.dart';

class HomeGridView extends StatelessWidget {
  const HomeGridView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListHeader(title: 'Wipeout Sale'),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: GridView.builder(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: 4,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 12,
              mainAxisSpacing: 12,
            ),
            itemBuilder: (ctx, index) => GridViewItem(
              imageUrl: gridUrl[index],
            ),
          ),
        ),
      ],
    );
  }
}

class GridViewItem extends StatelessWidget {
  const GridViewItem({super.key, required this.imageUrl});

  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Image.network(
        imageUrl,
        fit: BoxFit.fill,
      ),
    );
  }
}

List<String> gridUrl = [
  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSNbeRK4USj4YyyKN0lYR9JltFRAPsROjx1xA&usqp=CAU',
  'https://dymatize.imgix.net/a/general/Snapinsta.app_335856812_114950998193924_7935316392001877715_n_1080.jpg?ar=675%3A840&auto=format%2Ccompress&fit=crop&ixlib=php-3.1.0&s=013351454a46fe178c4b1f26e19dd7c0',
  'https://5.imimg.com/data5/SELLER/Default/2023/3/VT/NV/LG/102883219/img-20221206-173540.jpg',
  'https://naturaltein.in/wp-content/uploads/2022/06/Here-is-the-Best-Protein-Supplement-in-India-Without-Side-Effects.jpeg'
];