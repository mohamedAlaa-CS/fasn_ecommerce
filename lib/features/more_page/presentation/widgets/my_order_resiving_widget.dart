import 'package:fasn_ecommerce/core/helper/extensions/assetss_widgets.dart';
import 'package:fasn_ecommerce/core/utils/app_colors.dart';
import 'package:fasn_ecommerce/core/utils/app_styles.dart';
import 'package:flutter/material.dart';

class MyOrderResivingWidget extends StatelessWidget {
  const MyOrderResivingWidget({
    super.key,
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.color,
  });
  final String title, subtitle;
  final IconData icon;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: 10.aEdge,
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.borderColor),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          Container(
            padding: 10.aEdge,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: AppColors.ligthColor,
              // borderRadius: 100.cBorder,
            ),
            child: Icon(
              icon,
              color: color,
              size: 26,
            ),
          ),
          10.wSize,
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  title,
                  textAlign: TextAlign.start,
                  style: AppStyles.style24,
                ),
                Text(
                  subtitle,
                  style: AppStyles.style20,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
