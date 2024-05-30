import 'package:cached_network_image/cached_network_image.dart';
import 'package:fasn_ecommerce/core/helper/extensions/assetss_widgets.dart';
import 'package:fasn_ecommerce/core/utils/app_colors.dart';
import 'package:fasn_ecommerce/core/utils/app_styles.dart';
import 'package:fasn_ecommerce/features/category/presentation/widgets/quntaty_number_of_product.dart';
import 'package:fasn_ecommerce/features/home/presentaion/views/product_details_view.dart';
import 'package:flutter/material.dart';

class ProductWidget extends StatelessWidget {
  const ProductWidget({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.price,
    required this.oldPrice,
    this.numberOffer,
    this.offer = false,
    required this.isFav,
  });
  final String imageUrl, title;
  final double price, oldPrice;
  final bool? offer;
  final int? numberOffer;
  final bool isFav;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushNamed(ProductDetailsView.routeName);
      },
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Stack(children: [
            AspectRatio(
                aspectRatio: 1,
                child: CachedNetworkImage(
                  imageUrl: imageUrl,
                  fit: BoxFit.cover,
                  width: double.infinity,
                )),

            //? fav widget ====================
            Positioned.directional(
              textDirection: Directionality.of(context),
              end: 10,
              top: 10,
              child: Container(
                padding: const EdgeInsetsDirectional.all(8),
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.ligthColor,
                ),
                child: isFav
                    ? const Icon(
                        Icons.favorite,
                        color: AppColors.redColor,
                      )
                    : const Icon(Icons.favorite_outline),
              ),
            ),

            //? offer widget ====================
            if (offer ?? false) ...{
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
                    '$numberOffer% off',
                    style: AppStyles.style12.copyWith(fontSize: 10),
                  ),
                ),
              ),
            }
          ]),
        ),
        10.hSize,
        Text(
          title,
          style: AppStyles.style16,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
        Row(
          children: [
            Text(
              '$price\$',
              style: AppStyles.style12,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            8.wSize,
            Text(
              '$oldPrice\$',
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
      ]),
    );
  }
}
