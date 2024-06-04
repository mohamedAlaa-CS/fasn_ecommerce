import 'package:fasn_ecommerce/core/helper/extensions/assetss_widgets.dart';
import 'package:fasn_ecommerce/features/cart/data/repos/cart_repo_imple.dart';
import 'package:fasn_ecommerce/features/cart/presentaion/manager/cubit/cart_cubit.dart';
import 'package:fasn_ecommerce/features/cart/presentaion/views/widgets/cart_product_widget.dart';
import 'package:fasn_ecommerce/features/cart/presentaion/views/widgets/checkout_button.dart';
import 'package:fasn_ecommerce/features/cart/presentaion/views/widgets/total_price_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartView extends StatelessWidget {
  const CartView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CartCubit(CartRepoImple())..getCart(),
      child: BlocConsumer<CartCubit, CartState>(
        listener: (context, state) {},
        builder: (context, state) {
          CartCubit cartCubit = CartCubit.get(context);
          return Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Column(
                    children: [
                      ListView.separated(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        separatorBuilder: (context, index) => 10.hSize,
                        itemCount: cartCubit.cartModel?.cartItems?.length ?? 0,
                        itemBuilder: (context, index) {
                          return CartProductWidget(
                            imageUrl: cartCubit.cartModel?.cartItems![index]
                                    .product!.image ??
                                '',
                            // 'https://images.unsplash.com/photo-1575936123452-b67c3203c357?q=80&w=1000&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8aW1hZ2V8ZW58MHx8MHx8fDA%3D',
                            title: cartCubit.cartModel?.cartItems![index]
                                    .product?.name ??
                                '',
                            price: cartCubit.cartModel?.cartItems![index]
                                    .product?.price ??
                                0,
                            oldPrice: cartCubit.cartModel?.cartItems![index]
                                    .product?.oldPrice ??
                                0,
                            qty: 2,
                            addItem: () {},
                            removeItem: () {},
                            deleteItem: () {},
                          );
                        },
                      ),
                      15.hSize,
                      TotalWidget(
                        totalPrice: cartCubit.cartModel?.total ?? 0,
                      ),
                      10.hSize,
                    ],
                  ),
                ),
              ),
              3.hSize,
              ChechoutButton(
                onTap: () {},
              )
            ],
          );
        },
      ),
    );
  }
}
