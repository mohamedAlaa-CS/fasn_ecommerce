import 'package:fasn_ecommerce/core/helper/extensions/assetss_widgets.dart';
import 'package:fasn_ecommerce/core/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

BottomNavigationBarItem bootomNAvItem(
    {required bool select, required String image}) {
  return BottomNavigationBarItem(
    icon: Container(
        alignment: Alignment.center,
        padding: 13.aEdge,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: select ? AppColors.white : AppColors.primaryColor,
          // borderRadius: 100.cBorder,
        ),
        child: SvgPicture.asset(
          image,
          color: select ? AppColors.primaryColor : AppColors.white,
          height: 20,
        )),
    label: '',
  );
}
