import 'package:fasn_ecommerce/core/utils/app_colors.dart';
import 'package:fasn_ecommerce/core/utils/app_styles.dart';
import 'package:fasn_ecommerce/generated/l10n.dart';
import 'package:flutter/material.dart';

class ShowAllDetailsproduct extends StatelessWidget {
  const ShowAllDetailsproduct({
    super.key,
    required this.isShow,
    required this.showOntap,
    required this.productDescription,
  });
  final bool isShow;
  final VoidCallback showOntap;
  final String productDescription;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsetsDirectional.symmetric(
        vertical: 15,
        horizontal: 10,
      ),
      decoration: BoxDecoration(
        color: AppColors.violateColor,
        borderRadius: BorderRadius.circular(8),
      ),
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                S.of(context).product_details,
                style: AppStyles.style12,
              ),
              const Spacer(),
              GestureDetector(
                onTap: showOntap,
                child: Icon(
                  isShow
                      ? Icons.keyboard_arrow_down_outlined
                      : Icons.keyboard_arrow_right_outlined,
                  color: AppColors.white,
                  size: 24,
                ),
              )
            ],
          ),
          if (isShow) ...{
            Text(
              productDescription,
              style: AppStyles.style12.copyWith(color: AppColors.borderColor),
            ),
          }
        ],
      ),
    );
  }
}
