import 'package:cached_network_image/cached_network_image.dart';
import 'package:fasn_ecommerce/core/helper/extensions/assetss_widgets.dart';
import 'package:fasn_ecommerce/core/helper/extensions/context_size.dart';
import 'package:fasn_ecommerce/core/utils/app_colors.dart';
import 'package:fasn_ecommerce/core/utils/app_strings.dart';
import 'package:fasn_ecommerce/core/utils/app_styles.dart';
import 'package:fasn_ecommerce/features/category/data/repos/product_repo_imple.dart';
import 'package:fasn_ecommerce/features/category/presentation/manager/product_cubit/product_cubit.dart';
import 'package:fasn_ecommerce/features/category/presentation/widgets/quntaty_number_of_product.dart';
import 'package:fasn_ecommerce/features/home/data/models/home_model/product_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

class FavProductWidget extends StatelessWidget {
  const FavProductWidget({
    super.key,
    required this.deletOnTap,
    required this.product,
  });

  final VoidCallback deletOnTap;

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    bool isPortrait =
        MediaQuery.of(context).orientation == Orientation.portrait;
    return Container(
      padding: const EdgeInsets.all(15),
      margin: EdgeInsets.symmetric(horizontal: isPortrait ? 10 : 12),
      decoration: BoxDecoration(
        color: AppColors.violateColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          //? image widget ====================
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: CachedNetworkImage(
              height: isPortrait ? context.height / 5.8 : context.width / 5.3,
              width: isPortrait ? context.width / 2.5 : context.height / 1.5,
              fit: BoxFit.cover,
              imageUrl: product.image ?? '',
              placeholder: (context, url) =>
                  const Center(child: CircularProgressIndicator()),
              errorWidget: (context, url, error) => const Icon(Icons.error),
            ),
          ),
          20.wSize,

          //? details widget ====================
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Align(
                  alignment: AlignmentDirectional.bottomEnd,
                  child: GestureDetector(
                    onTap: deletOnTap,
                    child: SvgPicture.asset(
                      AppStrings.favDeleteIcon,
                      height: 24,
                    ),
                  ),
                ),
                5.hSize,
                Text(
                  product.name ?? '',
                  style: AppStyles.style20,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                10.hSize,
                Row(
                  children: [
                    Text(
                      '\$${product.price}',
                      style: AppStyles.style14,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    12.wSize,
                    Text(
                      '\$${product.oldPrice}',
                      style: AppStyles.style14.copyWith(
                          decoration: TextDecoration.lineThrough,
                          color: AppColors.borderColor),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
                SizedBox(
                  height: isPortrait ? context.height / 30 : context.width / 17,
                ),
                // //? delete and add button widget ====================
                BlocProvider(
                  create: (context) =>
                      ProductCubit(product, ProductRepoImple()),
                  child: BlocConsumer<ProductCubit, ProductState>(
                    listener: (context, state) {},
                    builder: (context, state) {
                      var productCubit = ProductCubit.get(context);
                      return QuntatyNumberofProduct(
                        qtr: productCubit.qty,
                        addOnTap: () async {
                          await productCubit.addItem();
                        },
                        removeOnTap: () async {
                          await productCubit.removeItem();
                        },
                        cartOnTap: () async {
                          await productCubit.addTOCart();
                        },
                        looding:
                            state is ProdectAddToCartLoading ? true : false,
                      );
                    },
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
