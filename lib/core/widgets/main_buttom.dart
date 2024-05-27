import 'package:fasn_ecommerce/core/helper/extensions/assetss_widgets.dart';
import 'package:fasn_ecommerce/core/utils/app_colors.dart';
import 'package:fasn_ecommerce/core/widgets/main_text.dart';
import 'package:flutter/material.dart';

class MainButtom extends StatelessWidget {
  const MainButtom({
    super.key,
    this.height,
    this.onPressed,
    required this.text,
    this.textStyle,
  });
  final double? height;
  final VoidCallback? onPressed;
  final TextStyle? textStyle;
  final String text;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height ?? 51,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.white,
          shape: RoundedRectangleBorder(
            borderRadius: 12.cBorder,
          ),
        ),
        onPressed: onPressed ?? () {},
        child: Align(
          alignment: Alignment.center,
          child: MainText.textButton(text),
        ),
      ),
    );
  }
}
