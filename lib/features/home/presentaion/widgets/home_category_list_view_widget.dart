import 'package:fasn_ecommerce/core/helper/extensions/assetss_widgets.dart';
import 'package:fasn_ecommerce/features/category/data/models/category_model.dart';
import 'package:fasn_ecommerce/features/home/presentaion/widgets/home_category_widget.dart';
import 'package:flutter/material.dart';

class HomeCategoryListView extends StatelessWidget {
  const HomeCategoryListView(
      {super.key, required this.onTap, required this.categoryList});
  final VoidCallback onTap;
  final List<CategoryModel> categoryList;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(categoryList.length, (index) {
          return Row(
            children: [
              GestureDetector(
                onTap: onTap,
                child: HomeCategoryWidget(
                  imageUrl: categoryList[index].image ?? '',
                  title: categoryList[index].name ?? '',
                ),
              ),
              10.wSize,
            ],
          );
        }),
      ),
    );
  }
}
