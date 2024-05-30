import 'package:cached_network_image/cached_network_image.dart';
import 'package:fasn_ecommerce/core/helper/extensions/assetss_widgets.dart';
import 'package:fasn_ecommerce/core/utils/app_colors.dart';
import 'package:fasn_ecommerce/core/utils/app_styles.dart';
import 'package:fasn_ecommerce/generated/l10n.dart';
import 'package:flutter/material.dart';

class ProductDetailsView extends StatelessWidget {
  static const String routeName = 'product_details_view';
  const ProductDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    bool isportrait =
        MediaQuery.of(context).orientation == Orientation.portrait;
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Stack(
              children: [
                AspectRatio(
                  aspectRatio: isportrait ? (1 / 0.9) : (1 / 0.4),
                  child: CachedNetworkImage(
                    imageUrl:
                        'https://images.unsplash.com/photo-1575936123452-b67c3203c357?q=80&w=1000&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8aW1hZ2V8ZW58MHx8MHx8fDA%3D',
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned.directional(
                  textDirection: Directionality.of(context),
                  top: 28,
                  start: 25,
                  child: Container(
                    decoration: const BoxDecoration(
                        color: AppColors.white, shape: BoxShape.circle),
                    padding: const EdgeInsets.all(8),
                    child: const Icon(
                      Icons.arrow_back_ios_new_outlined,
                    ),
                  ),
                ),
                Positioned.directional(
                  textDirection: Directionality.of(context),
                  bottom: 28,
                  end: 25,
                  child: Container(
                    decoration: const BoxDecoration(
                        color: AppColors.white, shape: BoxShape.circle),
                    padding: const EdgeInsets.all(8),
                    child: const Icon(
                      Icons.favorite_border_outlined,
                    ),
                  ),
                )
              ],
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              padding: const EdgeInsets.all(8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Product Name',
                    style: AppStyles.style20,
                  ),
                  7.hSize,
                  Text(
                    'category name',
                    style: AppStyles.style12
                        .copyWith(color: AppColors.borderColor),
                  ),
                  7.hSize,
                  Row(
                    children: [
                      Text(
                        '\$10.00 ',
                        style: AppStyles.style16,
                      ),
                      10.wSize,
                      Text(
                        ' \$15.00',
                        style: AppStyles.style16.copyWith(
                          color: AppColors.borderColor,
                          decoration: TextDecoration.lineThrough,
                        ),
                      ),
                      15.wSize,
                      Text(
                        '20% OFF',
                        style: AppStyles.style16
                            .copyWith(color: AppColors.redColor),
                      ),
                    ],
                  ),
                  7.hSize,
                  Text(
                    S.of(context).selesct_quantity,
                    style: AppStyles.style14,
                  ),
                  7.hSize,
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsetsDirectional.all(5),
                        decoration: BoxDecoration(
                          color: AppColors.ligthColor,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: const Icon(
                          Icons.add,
                          color: AppColors.black,
                          size: 20,
                        ),
                      ),
                      15.wSize,
                      Text(
                        '1',
                        style: AppStyles.style20,
                      ),
                      15.wSize,
                      Container(
                        padding: const EdgeInsetsDirectional.all(5),
                        decoration: BoxDecoration(
                          color: AppColors.ligthColor,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: const Icon(
                          Icons.remove,
                          color: AppColors.black,
                          size: 20,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
