import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:fasn_ecommerce/core/helper/extensions/assetss_widgets.dart';
import 'package:fasn_ecommerce/core/utils/app_colors.dart';
import 'package:fasn_ecommerce/core/utils/app_styles.dart';
import 'package:fasn_ecommerce/features/category/data/repos/product_repo_imple.dart';
import 'package:fasn_ecommerce/features/category/presentation/manager/product_cubit/product_cubit.dart';
import 'package:fasn_ecommerce/features/category/presentation/views/product_details_view.dart';
import 'package:fasn_ecommerce/features/category/presentation/widgets/quntaty_number_of_product.dart';
import 'package:fasn_ecommerce/features/home/data/models/home_model/product_model.dart';
import 'package:fasn_ecommerce/features/home/presentaion/manager/main_cubit/main_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductWidget extends StatelessWidget {
  const ProductWidget({
    super.key,
    required this.product,
  });

  final ProductModel product;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProductCubit(product, ProductRepoImple()),
      child: GestureDetector(
        onTap: () {
          Navigator.of(context)
              .pushNamed(ProductDetailsView.routeName, arguments: product);
        },
        child: BlocConsumer<ProductCubit, ProductState>(
          listener: (context, state) {},
          builder: (context, state) {
            log(product.inFavorites.toString());
            var productCubit = ProductCubit.get(context);
            return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Stack(children: [
                      AspectRatio(
                          aspectRatio: 1,
                          child: CachedNetworkImage(
                            imageUrl: product.image ?? '',
                            fit: BoxFit.cover,
                            width: double.infinity,
                          )),

                      //? fav widget ====================
                      Positioned.directional(
                        textDirection: Directionality.of(context),
                        end: 10,
                        top: 10,
                        child: GestureDetector(
                          onTap: () async {
                            await productCubit.addToFavorate();
                          },
                          child: BlocConsumer<MainCubit, MainState>(
                            listener: (context, state) {},
                            builder: (context, state) {
                              var mainCubit = MainCubit.get(context);
                              return Container(
                                padding: const EdgeInsetsDirectional.all(8),
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: AppColors.ligthColor,
                                ),
                                child: (mainCubit.isProductFav(product.id)) ??
                                        product.inFavorites ??
                                        false
                                    ? const Icon(
                                        Icons.favorite,
                                        color: AppColors.redColor,
                                      )
                                    : const Icon(Icons.favorite_outline),
                              );
                            },
                          ),
                        ),
                      ),

                      //? offer widget ====================
                      if (product.discount != null &&
                          product.discount != 0) ...{
                        Positioned.directional(
                          textDirection: Directionality.of(context),
                          start: 10,
                          top: 10,
                          child: Container(
                            padding: const EdgeInsetsDirectional.all(8),
                            decoration: BoxDecoration(
                              color: AppColors.black,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Text(
                              '${product.discount}% off',
                              style: AppStyles.style12.copyWith(fontSize: 10),
                            ),
                          ),
                        ),
                      }
                    ]),
                  ),
                  10.hSize,
                  Text(
                    product.name ?? '',
                    style: AppStyles.style16,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Row(
                    children: [
                      Text(
                        '${product.price}\$',
                        style: AppStyles.style12,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      8.wSize,
                      Text(
                        '${product.oldPrice}\$',
                        style: AppStyles.style12.copyWith(
                          color: AppColors.borderColor,
                          decoration: TextDecoration.lineThrough,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                  7.hSize,
                  Expanded(
                    child: QuntatyNumberofProduct(
                      qtr: 1,
                      addOnTap: () {},
                      removeOnTap: () {},
                      cartOnTap: () {},
                    ),
                  ),
                  // 7.hSize
                ]);
          },
        ),
      ),
    );
  }
}
