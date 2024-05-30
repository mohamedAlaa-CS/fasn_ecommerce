import 'package:fasn_ecommerce/features/category/data/repos/category_repo.dart';
import 'package:fasn_ecommerce/features/home/data/models/home_model/product_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'category_state.dart';

class CategoryCubit extends Cubit<CategoryState> {
  CategoryCubit(this.categoryRepo) : super(CategoryInitial());
  static CategoryCubit get(context) => BlocProvider.of(context);
  final CategoryRepo categoryRepo;
  List<ProductModel> productsOfCategory = [];
  Future<void> getProductsOfCategory({required int categoryId}) async {
    emit(ProductsOfCategoryLoading());
    final result =
        await categoryRepo.getProductsOfCategpryData(categoryId: categoryId);
    result.fold((error) {
      emit(ProductsOfCategoryFailed(message: error.message));
    }, (products) {
      emit(ProductsOfCategorySuccess());
      productsOfCategory.addAll(products);
    });
  }
}
