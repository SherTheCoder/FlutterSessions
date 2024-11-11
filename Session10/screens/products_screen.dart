import 'package:flutter/material.dart';

import '../widgets/products_appbar.dart';
import '../widgets/vertical_item.dart';

class ProductsScreen extends StatelessWidget {
  const ProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ProductsAppbar(
        isCart: false,
        title: 'Optimum Nutrition',
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 12),
        child: ListView.separated(
            itemBuilder: (ctx, index){
              for(int i = 0; i < 20 ; i++) return VerticalItem();
            },
            separatorBuilder: (BuildContext context, int index) => SizedBox(
                  height: 12,
                ),
            itemCount: 20),
      ),
    );
  }
}
