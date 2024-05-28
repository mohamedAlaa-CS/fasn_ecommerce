import 'package:fasn_ecommerce/core/utils/app_colors.dart';
import 'package:flutter/material.dart';

class CustomDotIndecator extends StatelessWidget {
  const CustomDotIndecator({super.key, required this.isActive});
  final bool isActive;
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      height: 6,
      width: isActive ? 28 : 6,
      decoration: BoxDecoration(
          color: isActive ? AppColors.white : AppColors.ligthColor,
          borderRadius: BorderRadius.circular(12)),
    );
  }
}
