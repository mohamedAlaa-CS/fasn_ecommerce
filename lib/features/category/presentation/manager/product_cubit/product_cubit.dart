import 'dart:developer';

import 'package:fasn_ecommerce/core/helper/functions/show_snack_bar.dart';
import 'package:fasn_ecommerce/features/category/data/repos/product_repo.dart';
import 'package:fasn_ecommerce/features/home/data/models/home_model/product_model.dart';
import 'package:fasn_ecommerce/features/home/presentaion/manager/main_cubit/main_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'product_state.dart';

class ProductCubit extends Cubit<ProductState> {
  ProductCubit(this.product, this.productRepo) : super(ProductInitial()) {
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
//! Add to favorate logic  ==================================
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

//! show or hide details product =============================
  int currentIndex = 0;
  bool isShow = false;

  PageController pageController = PageController();
  void changeShow() {
    isShow = !isShow;
    emit(ChangeShowState());
  }

  //! Add to cart logic  ==================================
  int qty = 1;

  addItem() {
    qty++;
    emit(AddItemState());
  }

  removeItem() {
    if (qty > 1) {
      qty--;
    }
    emit(RemoveItemState());
  }

  addTOCart() async {
    emit(ProdectAddToCartLoading());
    var result = await productRepo.addToCart(productId: product.id!);

    result.fold((error) {
      emit(ProdectAddToCartFailed());
      showSnackbar(error.message, error: true);
  
    }, (success) async {
      emit(ProdectAddToCartSuccess());
      showSnackbar(success.message ?? '');
      await cartQuntaty(productId: success.id ?? 0);
    });
  }

  cartQuntaty({required int productId}) async {
    emit(ProductAddQuantityLoading());
    var result = await productRepo.updateQuantity(productId: productId, qty: 3);

    result.fold((error) {
      emit(ProductAddQuantityLoading());
      //showSnackbar(error.message, error: true);
    }, (success) {
      qty = 1;
      emit(ProductAddQuantitySuccess());
      // showSnackbar(success);
    });
  }
}
