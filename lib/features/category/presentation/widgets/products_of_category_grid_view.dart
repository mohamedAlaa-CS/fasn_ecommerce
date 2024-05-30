import 'package:fasn_ecommerce/features/category/data/repos/category_repo_imple.dart';
import 'package:fasn_ecommerce/features/category/presentation/manager/category/category_cubit.dart';
import 'package:fasn_ecommerce/features/home/presentaion/widgets/product_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductsOfCategoryGrideView extends StatelessWidget {
  const ProductsOfCategoryGrideView({super.key, required this.categoryId});
  final int categoryId;
  @override
  Widget build(BuildContext context) {
    bool isPortrait =
        MediaQuery.of(context).orientation == Orientation.portrait;
    return BlocProvider(
      create: (context) => CategoryCubit(CategoryRepoImple())
        ..getProductsOfCategory(categoryId: categoryId),
      child: BlocConsumer<CategoryCubit, CategoryState>(
        listener: (context, state) {},
        builder: (context, state) {
          var categoryCubit = CategoryCubit.get(context);
          return Expanded(
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 20,
                crossAxisSpacing: 20,
                childAspectRatio: isPortrait ? (1 / 1.55) : (1 / 1.26),
              ),
              itemBuilder: (context, index) {
                return ProductWidget(
                  imageUrl: categoryCubit.productsOfCategory[index].image ?? '',
                  title: categoryCubit.productsOfCategory[index].name ?? '',
                  price: categoryCubit.productsOfCategory[index].price ?? 0.0,
                  oldPrice:
                      categoryCubit.productsOfCategory[index].oldPrice ?? 0.0,
                  isFav: categoryCubit.productsOfCategory[index].inFavorites ??
                      false,
                  offer: categoryCubit.productsOfCategory[index].discount != 0,
                  numberOffer: categoryCubit.productsOfCategory[index].discount,
                );
              },
              itemCount: categoryCubit.productsOfCategory.length,
            ),
          );
        },
      ),
    );
  }
}
