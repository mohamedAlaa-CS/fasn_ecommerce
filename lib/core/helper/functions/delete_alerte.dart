import 'package:fasn_ecommerce/core/helper/extensions/assetss_widgets.dart';
import 'package:fasn_ecommerce/core/utils/app_strings.dart';
import 'package:fasn_ecommerce/core/widgets/main_buttom.dart';
import 'package:fasn_ecommerce/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../utils/app_colors.dart';
import '../../utils/app_styles.dart';

Future ShowDialog(
  BuildContext context, {
  required String message,
  required VoidCallback yesOntap,
  required VoidCallback noOntap,
}) async {
  return await showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        backgroundColor: Colors.white,
        title: Center(
          child: SvgPicture.asset(
            AppStrings.deleteIcon,
            height: 70,
          ),
        ),
        content: Text(
          message,
          style: AppStyles.style14.copyWith(color: AppColors.black),
        ),
        actions: <Widget>[
          Column(
            children: [
              20.hSize,
              MainButtom(
                color: AppColors.redColor,
                text: S.of(context).yes,
                onPressed: yesOntap,
              ),
              10.hSize,
              SizedBox(
                width: double.infinity,
                height: 45,
                child: OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    // side: const BorderSide(width: 1.0, color: AppColors.redColor),
                    backgroundColor: AppColors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: 12.cBorder,
                    ),
                  ),
                  onPressed: noOntap,
                  child: Text(
                    S.of(context).cancel,
                    style: AppStyles.style18.copyWith(color: AppColors.black),
                  ),
                ),
              ),
            ],
          ),
        ],
      );
    },
  );
}
