import 'package:cached_network_image/cached_network_image.dart';
import 'package:fasn_ecommerce/core/helper/extensions/assetss_widgets.dart';
import 'package:fasn_ecommerce/core/helper/extensions/context_size.dart';
import 'package:fasn_ecommerce/core/utils/app_colors.dart';
import 'package:fasn_ecommerce/core/utils/app_styles.dart';
import 'package:fasn_ecommerce/features/cart/presentaion/views/widgets/add_and_remove_qunatay_widget.dart';
import 'package:flutter/material.dart';

class CartProductWidget extends StatelessWidget {
  const CartProductWidget(
      {super.key,
      required this.imageUrl,
      required this.title,
      required this.price,
      required this.oldPrice,
      required this.qty,
      required this.addItem,
      required this.removeItem,
      required this.deleteItem});
  final String imageUrl, title;
  final double price, oldPrice;
  final int qty;
  final VoidCallback addItem, removeItem, deleteItem;
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
              height: isPortrait ? context.height / 7 : context.width / 5.3,
              width: isPortrait ? context.width / 2.5 : context.height / 1.3,
              fit: BoxFit.cover,
              imageUrl: imageUrl,
              // 'https://images.unsplash.com/photo-1575936123452-b67c3203c357?q=80&w=1000&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8aW1hZ2V8ZW58MHx8MHx8fDA%3D',
              placeholder: (context, url) =>
                  const Center(child: CircularProgressIndicator()),
              errorWidget: (context, url, error) => const Icon(
                Icons.error,
                color: Colors.white,
              ),
            ),
          ),
          20.wSize,

          //? details widget ====================
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
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
                      '\$$oldPrice,}',
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
                AddAndRemoveQuntatyWidget(
                  qty: qty,
                  addItem: addItem,
                  removeItem: removeItem,
                  deleteItem: deleteItem,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
