import 'package:fasn_ecommerce/features/home/data/models/home_model/product_model.dart';
import 'package:fasn_ecommerce/features/home/presentaion/widgets/product_widget.dart';
import 'package:flutter/material.dart';

class ProdectGridVew extends StatelessWidget {
  const ProdectGridVew({super.key, required this.product});
  final List<ProductModel> product;
  @override
  Widget build(BuildContext context) {
    return SliverGrid.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
        childAspectRatio: 1 / 1.4,
      ),
      itemBuilder: (context, index) => GestureDetector(
        onTap: () {},
        child: ProductWidget(
          imageUrl: product[index].image ?? '',
          price: product[index].price ?? 0.0,
          oldPrice: product[index].oldPrice ?? 0.0,
          title: product[index].name ?? '',
          offer: product[index].discount != 0,
          numberOffer: product[index].discount,
          isFav: product[index].inFavorites ?? false,
        ),
      ),
      itemCount: product.length,
    );
  }
}
