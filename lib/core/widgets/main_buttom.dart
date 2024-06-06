import 'package:fasn_ecommerce/core/helper/extensions/assetss_widgets.dart';
import 'package:fasn_ecommerce/core/utils/app_colors.dart';
import 'package:fasn_ecommerce/core/utils/app_styles.dart';
import 'package:flutter/material.dart';

class MainButtom extends StatelessWidget {
  const MainButtom({
    super.key,
    this.height,
    this.onPressed,
    required this.text,
    this.textStyle,
    this.color = AppColors.white,
  });
  final double? height;
  final VoidCallback? onPressed;
  final TextStyle? textStyle;
  final String text;
  final Color? color;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height ?? 51,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          shape: RoundedRectangleBorder(
            borderRadius: 12.cBorder,
          ),
        ),
        onPressed: onPressed ?? () {},
        child: Align(
          alignment: Alignment.center,
          child: Text(text, style: textStyle ?? AppStyles.style20),

          //MainText.textButton(text, texStyle: textStyle),
        ),
      ),
    );
  }
}
