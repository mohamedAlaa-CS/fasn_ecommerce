import 'package:fasn_ecommerce/features/home/presentaion/widgets/product_widget.dart';
import 'package:flutter/material.dart';

class ProductsOfCategoryGrideView extends StatelessWidget {
  const ProductsOfCategoryGrideView({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
          childAspectRatio: 1 / 1.4,
        ),
        itemBuilder: (context, index) {
          return const ProductWidget(
            imageUrl:
                'https://images.unsplash.com/photo-1575936123452-b67c3203c357?q=80&w=1000&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8aW1hZ2V8ZW58MHx8MHx8fDA%3D',
            title: 'hello ',
            price: 10,
            oldPrice: 10,
            isFav: false,
          );
        },
        itemCount: 10,
      ),
    );
  }
}
