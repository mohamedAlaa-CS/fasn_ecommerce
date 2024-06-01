import 'package:fasn_ecommerce/core/helper/extensions/assetss_widgets.dart';
import 'package:fasn_ecommerce/features/favourite_page/presentaion/views/widgets/add_to_cart_widget.dart';
import 'package:fasn_ecommerce/features/favourite_page/presentaion/views/widgets/fav_product_widget.dart';
import 'package:flutter/material.dart';

class FavouritePage extends StatelessWidget {
  const FavouritePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: ListView.separated(
              separatorBuilder: (context, index) => 10.hSize,
              itemCount: 10,
              itemBuilder: (context, index) {
                return FavProductWidget(
                  image:
                      'https://images.unsplash.com/photo-1575936123452-b67c3203c357?q=80&w=1000&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8aW1hZ2V8ZW58MHx8MHx8fDA%3D',
                  title: 'hello alaaaaaaaaa',
                  price: 100,
                  oldPrice: 200,
                  deletOnTap: () {},
                  addOnTap: () {},
                  removeOnTap: () {},
                  qty: 1,
                );
              }),
        ),
        7.hSize,
        AddToCartButton(
          onTap: () {},
        )
      ],
    );
  }
}
