import 'package:fasn_ecommerce/core/helper/extensions/assetss_widgets.dart';
import 'package:fasn_ecommerce/core/utils/app_colors.dart';
import 'package:fasn_ecommerce/core/utils/app_styles.dart';
import 'package:fasn_ecommerce/generated/l10n.dart';
import 'package:flutter/material.dart';

class MyOrderWidget extends StatelessWidget {
  const MyOrderWidget(
      {super.key,
      required this.status,
      required this.orderDate,
      required this.orderCode,
      required this.total});
  final String status, orderDate;
  final int orderCode;
  final double total;
  @override
  Widget build(BuildContext context) {
    return Card(
      shape: BeveledRectangleBorder(borderRadius: BorderRadius.circular(4)),
      elevation: 5,
      shadowColor: Colors.black.withOpacity(0.4),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: AppColors.violateColor.withOpacity(0.3),
        ),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.all(12),
                  child: CircleAvatar(
                    radius: 20,
                    backgroundColor: AppColors.lightBlue,
                    child: Icon(
                      Icons.shopping_cart,
                      color: AppColors.blue,
                    ),
                  ),
                ),
                14.wSize,
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    12.hSize,
                    Text(
                      status,
                      style: AppStyles.style24.copyWith(
                        color: AppColors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    6.hSize,
                    Text(
                      '${S.of(context).oreder_date}: $orderDate',
                      style: AppStyles.style18.copyWith(
                        color: AppColors.black,
                      ),
                    ),
                    6.hSize,
                    Text(
                      '${S.of(context).order_code}: $orderCode',
                      style: AppStyles.style18.copyWith(
                        color: AppColors.black,
                      ),
                    ),
                    6.hSize,
                    Text(
                      '${S.of(context).total}: ${total.toStringAsFixed(2)}',
                      style: AppStyles.style18.copyWith(
                        color: AppColors.black,
                      ),
                    ),
                  ],
                )
              ],
            ),
            10.hSize,
            Container(
              height: 40,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(5),
                  bottomRight: Radius.circular(5),
                ),
                color: AppColors.ligthColor.withOpacity(0.4),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    S.of(context).oreder_details,
                    style: AppStyles.style20.copyWith(color: AppColors.blue),
                  ),
                  const Icon(
                    Icons.arrow_forward_ios,
                    color: AppColors.primaryColor,
                  ),
                  12.wSize,
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
