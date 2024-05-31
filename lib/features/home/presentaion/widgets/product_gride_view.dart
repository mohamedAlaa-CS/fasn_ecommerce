import 'package:fasn_ecommerce/features/home/data/models/home_model/product_model.dart';
import 'package:fasn_ecommerce/features/home/presentaion/widgets/product_widget.dart';
import 'package:flutter/material.dart';

class ProdectGridVew extends StatelessWidget {
  const ProdectGridVew({super.key, required this.product});
  final List<ProductModel> product;
  @override
  Widget build(BuildContext context) {
    bool isPortrait =
        MediaQuery.of(context).orientation == Orientation.portrait;
    return SliverGrid.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
        childAspectRatio: isPortrait ? (1 / 1.7) : (1 / 1.3),
      ),
      itemBuilder: (context, index) => GestureDetector(
        onTap: () {},
        child: ProductWidget(
   
          product: product[index],
        ),
      ),
      itemCount: product.length,
    );
  }
}
