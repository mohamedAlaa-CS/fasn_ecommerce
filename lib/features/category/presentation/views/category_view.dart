import 'package:fasn_ecommerce/core/helper/extensions/context_size.dart';
import 'package:fasn_ecommerce/core/utils/app_colors.dart';
import 'package:fasn_ecommerce/core/utils/app_strings.dart';
import 'package:fasn_ecommerce/features/category/presentation/widgets/category_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CategoryView extends StatelessWidget {
  static const String routeName = 'category_view';
  const CategoryView({super.key, required this.categoryList});
  final categoryList;
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
      body: CategoryListView(
        categoryList: categoryList,
      ),
    );
  }
}
