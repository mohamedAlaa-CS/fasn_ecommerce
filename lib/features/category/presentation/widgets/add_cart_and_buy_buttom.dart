import 'package:fasn_ecommerce/core/helper/extensions/assetss_widgets.dart';
import 'package:fasn_ecommerce/core/utils/app_colors.dart';
import 'package:fasn_ecommerce/core/utils/app_strings.dart';
import 'package:fasn_ecommerce/core/utils/app_styles.dart';
import 'package:fasn_ecommerce/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class AddCartAndBuyButtom extends StatelessWidget {
  const AddCartAndBuyButtom({
    super.key,
    required this.cartOntap,
    required this.buyOntap,
    required this.loading,
  });
  final VoidCallback cartOntap;
  final VoidCallback buyOntap;
  final bool loading;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Spacer(),
        Padding(
          padding: const EdgeInsetsDirectional.symmetric(horizontal: 10),
          child: Row(children: [
            Expanded(
              child: loading
                  ? const Center(
                      child: CircularProgressIndicator(
                      color: AppColors.blue,
                    ))
                  : OutlinedButton.icon(
                      style: OutlinedButton.styleFrom(
                        side: const BorderSide(
                          color: AppColors.white,
                          width: 1,
                        ),
                      ),
                      onPressed: cartOntap,
                      icon: const Icon(
                        Icons.add_shopping_cart_outlined,
                        color: AppColors.white,
                      ),
                      label: Text(
                        S.of(context).add_to_cart,
                        style: AppStyles.style16,
                      ),
                    ),
            ),
            8.wSize,
            Expanded(
              child: ElevatedButton.icon(
                onPressed: buyOntap,
                icon: SvgPicture.asset(
                  AppStrings.buyIcon,
                  color: AppColors.black,
                ),
                label: Text(
                  S.of(context).buy_now,
                  style: AppStyles.style16.copyWith(color: AppColors.black),
                ),
              ),
            )
          ]),
        ),
        30.hSize
      ],
    );
  }
}
