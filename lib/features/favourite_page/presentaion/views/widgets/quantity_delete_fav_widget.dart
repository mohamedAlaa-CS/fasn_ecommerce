import 'package:fasn_ecommerce/core/helper/extensions/assetss_widgets.dart';
import 'package:fasn_ecommerce/core/utils/app_colors.dart';
import 'package:fasn_ecommerce/core/utils/app_strings.dart';
import 'package:fasn_ecommerce/core/utils/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class QuantityAndDeleteFavwidget extends StatelessWidget {
  const QuantityAndDeleteFavwidget({
    super.key,
    required this.deletOnTap,
    required this.addOnTap,
    required this.removeOnTap,
    required this.qty,
  });
  final VoidCallback deletOnTap;
  final VoidCallback addOnTap;
  final VoidCallback removeOnTap;
  final int qty;
  @override
  Widget build(BuildContext context) {
    return Row(children: [
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
        qty.toString(),
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
    ]);
  }
}
