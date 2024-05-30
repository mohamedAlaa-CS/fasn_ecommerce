import 'package:fasn_ecommerce/core/helper/extensions/assetss_widgets.dart';
import 'package:fasn_ecommerce/core/helper/extensions/context_size.dart';
import 'package:fasn_ecommerce/core/utils/app_colors.dart';
import 'package:fasn_ecommerce/core/utils/app_strings.dart';
import 'package:fasn_ecommerce/core/utils/app_styles.dart';
import 'package:fasn_ecommerce/core/widgets/app_text_form.dart';
import 'package:fasn_ecommerce/features/category/presentation/widgets/products_of_category_grid_view.dart';
import 'package:fasn_ecommerce/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ProductsOfCategory extends StatelessWidget {
  static const String routeName = '/products_Of_Category';
  const ProductsOfCategory({super.key, required this.categoryId});
  final categoryId;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primaryColor,
        leadingWidth: context.width / 6,
        leading: SvgPicture.asset(
          AppStrings.logo,
          height: 24,
        ),
        actions: [
          SvgPicture.asset(AppStrings.notificationIcon),
        ],
      ),
      backgroundColor: AppColors.primaryColor,
      body: Column(children: [
        MainTextField(
          prefixIcon: Icons.search,
          hintText: S.of(context).hello,
          hintStyle: AppStyles.style18.copyWith(color: AppColors.borderColor),
          fillColor: AppColors.violateColor,
        ),
        12.hSize,
        ProductsOfCategoryGrideView(
          categoryId: categoryId,
        )
      ]),
    );
  }
}
