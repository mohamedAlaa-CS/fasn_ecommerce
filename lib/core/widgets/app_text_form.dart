import 'package:fasn_ecommerce/core/helper/extensions/assetss_widgets.dart';
import 'package:fasn_ecommerce/core/utils/app_colors.dart';
import 'package:fasn_ecommerce/core/widgets/main_text.dart';
import 'package:flutter/material.dart';

class MainTextField extends StatelessWidget {
  const MainTextField({
    super.key,
    this.contentPading,
    this.focusedBorder,
    this.enabledBorder,
    this.border,
    this.hintStyle,
    this.fillColor,
    this.suffixIcon,
    this.isobscure,
    this.hintText,
    this.controller,
    this.validator,
    this.suffixPressed,
    this.textType,
    this.title,
    this.prefixIcon,
    this.prefixIconOnPressed,
    this.titleColor,
    this.suffixWidget,
  });
  final EdgeInsetsGeometry? contentPading;
  final InputBorder? focusedBorder;
  final InputBorder? enabledBorder;
  final InputBorder? border;
  final TextStyle? hintStyle;
  final Color? fillColor;
  final Color? titleColor;
  final Widget? suffixWidget;
  final IconData? suffixIcon;
  final bool? isobscure;
  final String? hintText;
  final TextEditingController? controller;
  final String? Function(String? value)? validator;
  final VoidCallback? suffixPressed;
  final TextInputType? textType;
  final String? title;
  final IconData? prefixIcon;
  final VoidCallback? prefixIconOnPressed;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        if (title != null) ...{
          MainText.title(
            title!,
            color: titleColor ?? AppColors.white,
          ),
          18.hSize,
        },
        TextFormField(
          textAlignVertical: TextAlignVertical.center,
          //style: Styles.font16W300.copyWith(color: Colors.black),
          validator: validator,
          controller: controller,
          obscureText: isobscure ?? false,
          obscuringCharacter: '*',
          keyboardType: textType,
          decoration: InputDecoration(
            errorStyle: const TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
            prefixIcon: prefixIcon != null
                ? InkWell(
                    onTap: prefixIconOnPressed ?? () {},
                    child: Icon(prefixIcon, color: AppColors.white),
                  )
                : null,

            suffixIcon: suffixIcon != null || suffixWidget != null
                ? InkWell(
                    onTap: suffixPressed ?? () {},
                    child: suffixWidget ??
                        Icon(suffixIcon, color: Colors.grey.shade600),
                  )
                : null,
            hintText: hintText,
            hintStyle: hintStyle,
            //  hintStyle: hintStyle ?? Styles.font16W300,
            fillColor: fillColor ?? AppColors.white,
            filled: true,
            contentPadding: contentPading ??
                const EdgeInsetsDirectional.only(
                    top: 18, start: 16, bottom: 17),
            border: border ??
                OutlineInputBorder(
                  borderRadius: 12.cBorder,
                  borderSide: const BorderSide(
                    color: AppColors.grey,
                    width: 0.25,
                  ),
                ),
            enabledBorder: enabledBorder ??
                OutlineInputBorder(
                  borderRadius: 12.cBorder,
                  borderSide: const BorderSide(
                    color: AppColors.grey,
                    width: .25,
                  ),
                ),
            focusedBorder: focusedBorder ??
                OutlineInputBorder(
                  borderRadius: 12.cBorder,
                  borderSide: const BorderSide(
                    color: AppColors.grey,
                    width: .25,
                  ),
                ),
            errorBorder: OutlineInputBorder(
              //gapPadding: 0,
              borderRadius: 12.cBorder,
              borderSide: const BorderSide(
                color: Colors.red,
                width: 2,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
