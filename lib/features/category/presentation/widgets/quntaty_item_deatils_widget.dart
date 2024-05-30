import 'package:fasn_ecommerce/core/helper/extensions/assetss_widgets.dart';
import 'package:fasn_ecommerce/core/utils/app_colors.dart';
import 'package:fasn_ecommerce/core/utils/app_styles.dart';
import 'package:flutter/material.dart';

class QuntatyItemDetailsWidget extends StatelessWidget {
  const QuntatyItemDetailsWidget(
      {super.key,
      required this.qty,
      required this.addOntap,
      required this.removeOntap});
  final int qty;
  final VoidCallback addOntap;
  final VoidCallback removeOntap;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          onTap: addOntap,
          child: Container(
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
        ),
        15.wSize,
        Text(
          qty.toString(),
          style: AppStyles.style20,
        ),
        15.wSize,
        GestureDetector(
          onTap: removeOntap,
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
      ],
    );
  }
}
