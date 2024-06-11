import 'package:cached_network_image/cached_network_image.dart';
import 'package:fasn_ecommerce/core/helper/extensions/assetss_widgets.dart';
import 'package:fasn_ecommerce/core/helper/extensions/context_size.dart';
import 'package:fasn_ecommerce/core/utils/app_colors.dart';
import 'package:fasn_ecommerce/core/utils/app_styles.dart';
import 'package:fasn_ecommerce/generated/l10n.dart';
import 'package:flutter/material.dart';

class MyOrderDetailsWidget extends StatelessWidget {
  const MyOrderDetailsWidget({
    super.key,
    required this.image,
    required this.title,
    required this.price,
    required this.quantity,
  });
  final String image, title;
  final num price;
  final int quantity;
  @override
  Widget build(BuildContext context) {
    bool isPortrait =
        MediaQuery.of(context).orientation == Orientation.portrait;
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      elevation: 0,
      child: Container(
        padding: 10.aEdge,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: AppColors.violateColor.withOpacity(0.3),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: CachedNetworkImage(
                imageUrl: image,
                // 'https://cdn-icons-png.flaticon.com/512/3135/3135715.png',
                fit: BoxFit.cover,
                height: isPortrait ? context.height / 8 : context.width / 7,
                width: isPortrait ? context.width / 4.8 : context.height / 3,
              ),
            ),
            10.wSize,
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: AppStyles.style20.copyWith(color: AppColors.black),
                  ),
                  4.hSize,
                  4.hSize,
                  Row(
                    children: [
                      Text(
                        '\$${price.round()}',
                        style:
                            AppStyles.style18.copyWith(color: AppColors.black),
                      ),
                      8.wSize,
                      Text(
                        '${S.of(context).quantity}: $quantity',
                        style:
                            AppStyles.style18.copyWith(color: AppColors.black),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
