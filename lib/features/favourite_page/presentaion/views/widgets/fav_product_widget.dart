import 'package:cached_network_image/cached_network_image.dart';
import 'package:fasn_ecommerce/core/helper/extensions/assetss_widgets.dart';
import 'package:fasn_ecommerce/core/helper/extensions/context_size.dart';
import 'package:fasn_ecommerce/core/utils/app_colors.dart';
import 'package:fasn_ecommerce/core/utils/app_strings.dart';
import 'package:fasn_ecommerce/core/utils/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class FavProductWidget extends StatelessWidget {
  const FavProductWidget(
      {super.key,
      required this.image,
      required this.title,
      required this.price,
      required this.oldPrice,
      required this.deletOnTap});
  final String image, title;
  final double price, oldPrice;
  final VoidCallback deletOnTap;
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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //? image widget ====================
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: CachedNetworkImage(
              height: isPortrait ? context.height / 7.5 : context.width / 6.5,
              width: isPortrait ? context.width / 2.5 : context.height / 1.5,
              fit: BoxFit.cover,
              imageUrl: image,
              // 'https://images.unsplash.com/photo-1575936123452-b67c3203c357?q=80&w=1000&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8aW1hZ2V8ZW58MHx8MHx8fDA%3D',
              placeholder: (context, url) =>
                  const Center(child: CircularProgressIndicator()),
              errorWidget: (context, url, error) => const Icon(Icons.error),
            ),
          ),
          15.wSize,

          //? details widget ====================
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  title,
                  style: AppStyles.style20,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                10.hSize,
                Row(
                  children: [
                    Text(
                      '\$$price',
                      style: AppStyles.style14,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    12.wSize,
                    Text(
                      '\$$oldPrice',
                      style: AppStyles.style14.copyWith(
                          decoration: TextDecoration.lineThrough,
                          color: AppColors.borderColor),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
                SizedBox(
                  height: isPortrait ? context.height / 21 : context.width / 13,
                ),
                Align(
                  alignment: AlignmentDirectional.bottomEnd,
                  child: GestureDetector(
                    onTap: deletOnTap,
                    child: SvgPicture.asset(
                      AppStrings.favDeleteIcon,
                      height: 24,
                    ),
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