import 'package:fasn_ecommerce/core/utils/app_colors.dart';
import 'package:fasn_ecommerce/core/utils/app_strings.dart';
import 'package:fasn_ecommerce/core/utils/app_styles.dart';
import 'package:fasn_ecommerce/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ChechoutButton extends StatelessWidget {
  const ChechoutButton({super.key, required this.onTap});
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    bool isPortrait =
        MediaQuery.of(context).orientation == Orientation.portrait;
    return Container(
      padding: EdgeInsets.symmetric(horizontal: isPortrait ? 10 : 30),
      width: double.infinity,
      height: 55,
      child: ElevatedButton.icon(
          onPressed: onTap,
          icon: SvgPicture.asset(
            AppStrings.cartIcon,
            color: AppColors.black,
          ),
          label: Text(
            S.of(context).checkout,
            style: AppStyles.style16.copyWith(color: AppColors.black),
          )),
    );
  }
}
