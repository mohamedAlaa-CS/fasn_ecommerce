import 'package:fasn_ecommerce/core/helper/extensions/assetss_widgets.dart';
import 'package:fasn_ecommerce/features/cart/presentaion/views/widgets/cart_product_widget.dart';
import 'package:fasn_ecommerce/features/cart/presentaion/views/widgets/checkout_button.dart';
import 'package:fasn_ecommerce/features/cart/presentaion/views/widgets/total_price_widget.dart';
import 'package:flutter/material.dart';

class CartView extends StatelessWidget {
  const CartView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: ListView.separated(
            separatorBuilder: (context, index) => 10.hSize,
            itemCount: 10,
            itemBuilder: (context, index) {
              return CartProductWidget(
                imageUrl:
                    'https://images.unsplash.com/photo-1575936123452-b67c3203c357?q=80&w=1000&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8aW1hZ2V8ZW58MHx8MHx8fDA%3D',
                title: 'Product Title',
                price: 100,
                oldPrice: 120,
                qty: 2,
                addItem: () {},
                removeItem: () {},
                deleteItem: () {},
              );
            },
          ),
        ),
        3.hSize,
        const TotalWidget(
          totalPrice: 200,
        ),
        3.hSize,
        ChechoutButton(
          onTap: () {},
        )
      ],
    );
  }
}
