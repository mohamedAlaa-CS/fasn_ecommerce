import 'package:fasn_ecommerce/core/helper/functions/show_snack_bar.dart';
import 'package:fasn_ecommerce/features/category/data/repos/product_repo.dart';
import 'package:fasn_ecommerce/features/home/data/models/home_model/product_model.dart';
import 'package:fasn_ecommerce/features/home/presentaion/manager/main_cubit/main_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'product_state.dart';

class ProductCubit extends Cubit<ProductState> {
  ProductCubit(this.product, this.productRepo) : super(ProductInitial()){

    detailsPageController();
  }
  detailsPageController() {
    pageController.addListener(() {
      currentIndex = pageController.page!.round();
      emit(DetailsPageState());
    });
  }

  static ProductCubit get(context) => BlocProvider.of(context);

  final ProductModel product;
  final ProductRepo productRepo;

  Future<void> addToFavorate() async {
    product.inFavorites = !(product.inFavorites ?? false);
    emit(ProductAddOrRemoveFavLoading());

    var result = await productRepo.addToFavorate(productId: product.id ?? 0);

    result.fold((error) {
      product.inFavorites = !(product.inFavorites ?? false);
      emit((ProductAddOrRemoveFavfailed(errorMessage: error.message)));
      showSnackbar(
        error.message,
        error: true,
      );
    }, (success) {
      showSnackbar(success);
      emit(ProductAddOrRemoveFavSuccess(message: success));
      MainCubit.getFalse.addFavProduct(
        ProductFav(id: product.id!, isFav: product.inFavorites!),
      );
    });
    product.inFavorites = product.inFavorites;
  }

  int currentIndex = 0;
  bool isShow = false;

  PageController pageController = PageController();
  void changeShow() {
    isShow = !isShow;
    emit(ChangeShowState());
  }
}
