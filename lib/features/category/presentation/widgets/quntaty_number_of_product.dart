import 'package:fasn_ecommerce/core/helper/extensions/assetss_widgets.dart';
import 'package:fasn_ecommerce/core/utils/app_colors.dart';
import 'package:fasn_ecommerce/core/utils/app_styles.dart';
import 'package:flutter/material.dart';

class QuntatyNumberofProduct extends StatelessWidget {
  const QuntatyNumberofProduct({
    super.key,
    required this.qtr,
    required this.addOnTap,
    required this.removeOnTap,
    required this.cartOnTap,
  });
  final int qtr;
  final VoidCallback addOnTap;
  final VoidCallback removeOnTap;
  final VoidCallback cartOnTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Container(
          padding: const EdgeInsetsDirectional.all(5),
          decoration: BoxDecoration(
            color: AppColors.ligthColor,
            borderRadius: BorderRadius.circular(8),
          ),
          child: GestureDetector(
            onTap: addOnTap,
            child: const Icon(
              Icons.add,
              color: AppColors.black,
              size: 20,
            ),
          ),
        ),
        15.wSize,
        Text(
          qtr.toString(),
          style: AppStyles.style20,
        ),
        15.wSize,
        GestureDetector(
          onTap: removeOnTap,
          child: Container(
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
        ),
        const Spacer(),
        GestureDetector(
          onTap: cartOnTap,
          child: Container(
            padding: const EdgeInsetsDirectional.all(5),
            decoration: BoxDecoration(
              color: AppColors.blue,
              borderRadius: BorderRadius.circular(8),
            ),
            child: const Icon(
              Icons.add_shopping_cart_outlined,
              color: AppColors.white,
              size: 22,
            ),
          ),
        ),
        4.wSize,
      ],
    );
  }
}
