import 'dart:developer';

import 'package:fasn_ecommerce/core/helper/functions/show_snack_bar.dart';
import 'package:fasn_ecommerce/features/cart/data/models/cart_model/cart_model.dart';
import 'package:fasn_ecommerce/features/cart/data/repos/cart_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit(this.cartRepo) : super(CartInitial()) {
    getCart();
  }
  static CartCubit get(context) => BlocProvider.of(context);

  CartModel? cartModel;

  final CartRepo cartRepo;
  Future<void> getCart() async {
    cartModel = null;
    emit(CartLoading());
    var result = await cartRepo.getCartData();
    result.fold(
      (l) {
        emit(CartFailed(message: l.message));

   

        showSnackbar(l.message, error: true);
      },
      (success) {
        emit(CartSuccess());
        cartModel = success;
      },
    );
  }

//? add order to cart ===========

  Future<void> addOrder({
    required int addressId,
    required int paymentMethod,
    required bool usePoints,
  }) async {
    emit(AddOrderLoading());
    var result = await cartRepo.addOrder(
      addressId: addressId,
      paymentMethod: paymentMethod,
      usePoints: usePoints,
    );
    result.fold(
      (l) {
        emit(AddOrderFailed());

        showSnackbar(l.message, error: true);
      },
      (success) {
        emit(AddOrderSuccess());
        getCart();
        showSnackbar(success);
      },
    );
  }
}
