import 'package:fasn_ecommerce/core/helper/extensions/assetss_widgets.dart';
import 'package:fasn_ecommerce/core/utils/app_colors.dart';
import 'package:fasn_ecommerce/core/utils/app_strings.dart';
import 'package:fasn_ecommerce/core/utils/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class AddAndRemoveQuntatyWidget extends StatelessWidget {
  const AddAndRemoveQuntatyWidget(
      {super.key,
      required this.qty,
      required this.addItem,
      required this.removeItem,
      required this.deleteItem});
  final int qty;
  final VoidCallback addItem, removeItem, deleteItem;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          padding: const EdgeInsetsDirectional.all(5),
          decoration: BoxDecoration(
            color: AppColors.ligthColor,
            borderRadius: BorderRadius.circular(8),
          ),
          child: GestureDetector(
            onTap: addItem,
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
          onTap: removeItem,
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
            onTap: deleteItem,
            child: SvgPicture.asset(
              AppStrings.deleteIcon,
              height: 24,
            ),
          ),
        ),
      ],
    );
  }
}
