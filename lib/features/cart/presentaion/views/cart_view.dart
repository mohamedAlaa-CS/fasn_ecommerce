import 'package:fasn_ecommerce/core/helper/extensions/assetss_widgets.dart';
import 'package:fasn_ecommerce/core/utils/app_styles.dart';
import 'package:fasn_ecommerce/features/cart/data/models/cart_model/cart_item.dart';
import 'package:fasn_ecommerce/features/cart/data/repos/cart_item_repo_imple.dart';
import 'package:fasn_ecommerce/features/cart/data/repos/cart_repo_imple.dart';
import 'package:fasn_ecommerce/features/cart/presentaion/manager/cart_cubit/cart_cubit.dart';
import 'package:fasn_ecommerce/features/cart/presentaion/manager/cart_item_cubit/cart_item_product_cubit.dart';
import 'package:fasn_ecommerce/features/cart/presentaion/views/widgets/cart_product_widget.dart';
import 'package:fasn_ecommerce/features/cart/presentaion/views/widgets/cart_show_bottom_sheet.dart';
import 'package:fasn_ecommerce/features/cart/presentaion/views/widgets/checkout_button.dart';
import 'package:fasn_ecommerce/features/cart/presentaion/views/widgets/total_price_widget.dart';
import 'package:fasn_ecommerce/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartView extends StatelessWidget {
  const CartView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CartCubit(CartRepoImple()),
      child: BlocConsumer<CartCubit, CartState>(
        listener: (context, state) {},
        builder: (context, state) {
          CartCubit cartCubit = CartCubit.get(context);
          return RefreshIndicator(
            onRefresh: () async {
              await cartCubit.getCart();
            },
            child: Column(
              children: [
                Expanded(
                  child: (state is CartLoading && cartCubit.cartModel == null)
                      ? const Center(child: CircularProgressIndicator())
                      : (cartCubit.cartModel?.cartItems ?? []).isEmpty
                          ? Center(
                              child: Text(
                              S.of(context).no_products_in_cart,
                              style: AppStyles.style28,
                            ))
                          : SingleChildScrollView(
                              physics: const BouncingScrollPhysics(),
                              child: Column(
                                children: [
                                  ListView.separated(
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                    shrinkWrap: true,
                                    separatorBuilder: (context, index) =>
                                        10.hSize,
                                    itemCount: cartCubit
                                            .cartModel?.cartItems?.length ??
                                        0,
                                    itemBuilder: (context, index) {
                                      return BlocProvider(
                                        create: (context) =>
                                            CartItemProductCubit(
                                          cartItem: cartCubit.cartModel
                                                  ?.cartItems![index] ??
                                              CartItem(),
                                          cartItemRepo: CartItemRepoImple(),
                                        ),
                                        child: CartProductWidget(
                                          updateItem: () async {
                                            await cartCubit.getCart();
                                          },
                                        ),
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
                  onTap: () {
                    showCartBottomSheet(context).then(
                      (value) {
                        if (value == 1) {
                          cartCubit.addOrder(
                            addressId: 35,
                            paymentMethod: 1,
                            usePoints: false,
                          );
                        } else if (value == 2) {
                          cartCubit.addOrder(
                            addressId: 35,
                            paymentMethod: 2,
                            usePoints: true,
                          );
                        }
                      },
                    );
                  },
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
