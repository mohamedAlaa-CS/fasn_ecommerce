import 'package:fasn_ecommerce/core/helper/extensions/assetss_widgets.dart';
import 'package:fasn_ecommerce/core/utils/app_colors.dart';
import 'package:fasn_ecommerce/core/utils/app_strings.dart';
import 'package:fasn_ecommerce/core/utils/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

Future showAlertDialog(BuildContext context, String message) async {
    return await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: AppColors.white,
          title:  Center(
              child: SvgPicture.asset(AppStrings.deleteIcon, height: 70,)
              
            ),
          content: Text(message, style: AppStyles.style14,),
          actions: <Widget>[
            Column(
              children: [
                20.hSize,
                MainButton(
                  onPressed: () {
                    AppRoutes.pop(context, result: true, sub: true);
                  },
                  borderRadius: 10,
                  color: AppColors.danger,
                  child: MainText.textButton(
                    tr(context).delete,
                    textAlign: TextAlign.center,
                  ),
                ),
                10.hSize,
                MainButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  borderRadius: 10,
                  color: AppColors.white,
                  borderColor: AppColors.black,
                  child: MainText.textButton(
                    tr(context).cancel,
                    color: AppColors.black,
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            )
          ],
        );
      },
    );
  }