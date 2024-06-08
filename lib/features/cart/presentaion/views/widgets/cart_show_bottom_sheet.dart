import 'package:fasn_ecommerce/core/helper/extensions/assetss_widgets.dart';
import 'package:fasn_ecommerce/core/utils/app_colors.dart';
import 'package:fasn_ecommerce/core/utils/app_styles.dart';
import 'package:fasn_ecommerce/core/widgets/main_buttom.dart';
import 'package:fasn_ecommerce/generated/l10n.dart';
import 'package:flutter/material.dart';

Future<int?> showCartBottomSheet(
  BuildContext context,
) async {
  return await showModalBottomSheet<int>(
    context: context,
    builder: (context) {
      return Container(
        padding: const EdgeInsets.all(20),
        width: double.infinity,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            10.hSize,
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: const Align(
                alignment: AlignmentDirectional.centerStart,
                child: Icon(
                  Icons.cancel,
                  size: 30,
                  color: AppColors.redColor,
                ),
              ),
            ),
            10.hSize,
            Text(
              S.of(context).please_select_payment_method,
              style: AppStyles.style20.copyWith(
                color: Colors.black,
              ), //? total price
            ),
            20.hSize,
            MainButtom(
              text: S.of(context).cash_on_delivery,
              color: AppColors.blue,
              onPressed: () {
                Navigator.pop(context, 1);
              },
            ),
            10.hSize,
            SizedBox(
              width: double.infinity,
              height: 45,
              child: OutlinedButton(
                style: OutlinedButton.styleFrom(
                  backgroundColor: AppColors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: 12.cBorder,
                  ),
                ),
                onPressed: () {
                  Navigator.pop(context, 2);
                },
                child: Text(
                  S.of(context).online_payment,
                  style: AppStyles.style18.copyWith(color: AppColors.black),
                ),
              ),
            ),
            25.hSize,
          ],
        ),
      );
    },
  );
}
