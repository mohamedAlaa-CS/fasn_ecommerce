import 'package:fasn_ecommerce/core/utils/app_styles.dart';
import 'package:flutter/material.dart';

class PriceWidget extends StatelessWidget {
  const PriceWidget(
      {super.key, required this.title, required this.price, this.textColor});
  final String title;
  final double price;
  final Color? textColor;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          title,
          style: AppStyles.style20,
        ),
        const Spacer(),
        Text(
          '$price EGP',
          style: AppStyles.style20.copyWith(color: textColor),
        ),
      ],
    );
  }
}
