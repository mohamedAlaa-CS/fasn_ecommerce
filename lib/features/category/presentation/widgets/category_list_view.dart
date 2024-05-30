import 'package:fasn_ecommerce/core/helper/extensions/assetss_widgets.dart';
import 'package:fasn_ecommerce/features/category/presentation/views/prodect_of_category.dart';
import 'package:fasn_ecommerce/features/category/presentation/widgets/category_widget.dart';
import 'package:fasn_ecommerce/features/home/data/models/category_model.dart';
import 'package:flutter/widgets.dart';

class CategoryListView extends StatelessWidget {
  const CategoryListView({super.key, required this.categoryList});
  final List<CategoryModel> categoryList;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.separated(
        separatorBuilder: (context, index) {
          return 10.hSize;
        },
        itemCount: categoryList.length,
        itemBuilder: (context, index) {
          return CategortItemWidget(
            imageUrl: categoryList[index].image ?? '',
            title: categoryList[index].name ?? '',
            onTap: () {
              Navigator.pushNamed(
                context,
                ProductsOfCategory.routeName,
                arguments: categoryList[index].id,
              );
            },
          );
        },
      ),
    );
  }
}
