import 'package:cached_network_image/cached_network_image.dart';
import 'package:fasn_ecommerce/core/helper/extensions/assetss_widgets.dart';
import 'package:fasn_ecommerce/core/helper/extensions/context_size.dart';
import 'package:fasn_ecommerce/core/utils/app_colors.dart';
import 'package:fasn_ecommerce/core/utils/app_styles.dart';
import 'package:fasn_ecommerce/generated/l10n.dart';
import 'package:flutter/material.dart';

class CategortItemWidget extends StatelessWidget {
  const CategortItemWidget(
      {super.key,
      required this.imageUrl,
      required this.title,
      required this.onTap});
  final String imageUrl, title;
  final VoidCallback onTap;
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
              height: isPortrait ? context.height / 7.5 : context.width / 6.5,
              width: isPortrait ? context.width / 2.5 : context.height / 1.5,
              fit: BoxFit.cover,
              imageUrl: imageUrl,
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
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                10.hSize,
                //? Explore button =================
                GestureDetector(
                  onTap: onTap,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        padding: const EdgeInsetsDirectional.all(8),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: AppColors.white,
                          borderRadius: BorderRadius.circular(8),
                          //shape: BoxShape.rectangle,
                        ),
                        child: Row(
                          children: [
                            Text(
                              S.of(context).Explore,
                              style: AppStyles.style12MBlack,
                            ),
                            7.wSize,
                            const Icon(
                              Icons.arrow_forward_ios,
                              color: AppColors.black,
                              size: 12,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
