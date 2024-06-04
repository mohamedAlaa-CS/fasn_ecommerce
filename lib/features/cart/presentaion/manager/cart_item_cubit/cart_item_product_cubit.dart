import 'package:fasn_ecommerce/core/helper/functions/show_snack_bar.dart';
import 'package:fasn_ecommerce/features/cart/data/models/cart_model/cart_item.dart';
import 'package:fasn_ecommerce/features/cart/data/repos/cart_item_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'cart_item_product_state.dart';

class CartItemProductCubit extends Cubit<CartItemProductState> {
  CartItemProductCubit({required this.cartItemRepo, required this.cartItem})
      : super(CartItemProductInitial()) {
    qty = cartItem.quantity ?? 1;
  }

  static CartItemProductCubit get(context) => BlocProvider.of(context);

  final CartItemRepo cartItemRepo;
  final CartItem cartItem;

  int qty = 1;

  addItem() {
    qty++;
    emit(CartAddItemProduct());
  }

  removeItem() {
    if (qty > 1) qty--;
    emit(CartRemoveItemProduct());
  }

  Future<void> deleteCartItem() async {
    emit((CartDeleteItemProductLoading()));
    var result =
        await cartItemRepo.deleteCartItem(cartItemId: cartItem.id ?? 0);

    result.fold((error) {
      emit(CartDeleteItemProductFailed());
      showSnackbar(error.message);
    }, (success) {
      emit(CartDeleteItemProductSuccess());
    });
  }
}
